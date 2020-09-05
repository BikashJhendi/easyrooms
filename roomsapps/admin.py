from django.contrib import admin
from roomsapps.models import Rooms, RoomsImage, Rent


# Register your models here.
class AddImageAdmin(admin.StackedInline):
    model = RoomsImage


@admin.register(Rooms)
class AddAdmin(admin.ModelAdmin):
    inlines = [AddImageAdmin]

    class Meta:
        model = Rooms


@admin.register(RoomsImage)
class AddImageAdmin(admin.ModelAdmin):
    pass


admin.site.register(Rent)
