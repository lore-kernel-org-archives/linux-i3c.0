Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C0103E2EC
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 22:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lfYhlBQ5Xf9a89RWbhwA6c0nJhQnpxLeNtzDlUiI+A=; b=4HNB/SPVOwpEIN
	6ubHeHZUZhGzIFcHk7Ke/MKIGyy0+pFHjQ0R800FifpjxY6WWMRZViDXm2X+n4riJTu1XtGEWiLh1
	xlu8SnjED44smJ7+WsYCkGXBYPPPKK0SS/ElBuhygQISQYEqATo1NjCkNFx5sMOKXzWrLeBvYLc9f
	57J/JYnCUWcNjWa79Godcbo3v4Pg71+4QVbNTbLoTwMpFmHxdY+ckMYkG8MVvUKbqKIP7PloIrHjT
	Af0NMwf16hCkML2YykHfr6VLfpzp0VlRIoWjDlaOzIKLcDZUP8G2x+r+hLiNAWdpiPlz1CjJPBZ7w
	Pv0arMTxRs3tatDJqZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rcv-0000000Cbde-078Q;
	Wed, 11 Mar 2026 22:02:01 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYDi-00000000bdx-2fAr
	for linux-i3c@lists.infradead.org;
	Mon, 23 Feb 2026 15:51:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b8f86167d39so567862166b.0
        for <linux-i3c@lists.infradead.org>; Mon, 23 Feb 2026 07:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771861896; cv=none;
        d=google.com; s=arc-20240605;
        b=TQ95nyhdMloHCQgcr8JDJ3dCadzR+jNe9gQDInfRtRD254eaI5r8GgHvdtz9gpaZBc
         97nKKiwl9byeLTD1QMpCcQmy5m7gyf1W0YXRcN4vdA8exNndaRA4piNuueez6Hu5TjIP
         B5bHVs8MZenjPHIaM8R8z18+tBoQmPsEgM//dCpECJXHBouKt/7Gf9sd64P5+ZWbemqY
         XUMGuZjPTJvyjB6jwy8RRkPzXe0HrQR4QLkW6+XT+r/Wae0Mrf4AQUCI4mjx0UkZFFUa
         a48pIGb8P3lUJNDcvKSRpsoOmFY3EucrfrSKokSQ1XK0THijumpD9i/8J5aFwh22y77l
         p9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        fh=bjVHgxh9JXcQ88UNCEKSmPpSmxFkVoE7NfQsDvzDALw=;
        b=CnJ1QPqSU59V0UJxNZmhE4PZCU/kAqcKljUJqdD/ITXneDek6MdKMtMBTk62ExbMYU
         taPuwPEz6+XvCPqdL9hTiyekyZAe7+SsroUAxODkwSJy0cFLXcPcU6ipOE7UhQypd6Dp
         JOD/4O3cooqIY0krBpr6eb36II1uvGpo0eMs2d0+pl78KicK23Yxzepsds6Eu6X32DPu
         uD26GwajVC7oxA7JWT6m9cns604adUyZfdqAAhWOOsm+gZLjvU+5hw1yZf+XFnFGUxcl
         80rmFSuNJFtVKOJ4L3H6SmHqVX5sqnKb5nb1Bds4sgyQT6s8iEgCDYWdlaFOJmZVB9UP
         0GxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771861896; x=1772466696; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        b=KZiF84NgZnS4LKGtRZqjw+LdwB9/kaO9TAwjM2zkrIUw1rvh6XwivCJtjhfAg4+he2
         J+nRmVyDxpEgRRmvVrBLyAx/Lr8ITBAuwx/9D1NreS6FYVKmLBc6npv9ZijUw+/tg3uq
         5ym9xPUV2tEqgWjKUW03KC3+TQ9NtGFXQM5WCtvwJfIW2vhCWuxPlMyWpenzHOBBBapX
         4haM379fy9vfTY3BstvxSsJUplv41VfAi80iTakHlQrQMAAX4C4J2XPmQt9kphFUptRO
         pwkTwFo2tJClSZ2yHz43ikTKPyUDtY+I7ePwQsutVz2zBT4dC1OGyLdaqsSEbyFP0rdb
         07ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861896; x=1772466696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        b=FGYRyUmMlcGw/l5t0UEVdWBUcZKfSip5yyo10ffoW1a6MVE3bU2qIhYGzXdm4SoEnY
         jDmxz/9UDB9c1zGQuqQeiuVBb2Ay5sPv6Nybpz+2biBEXQd0QWRosBJ31X9TvY1eiaim
         4rpDqjVsIPETTfvDIMCpKrhzpz2gdrlTL2yDVnB+1VsXm5lImESx8yN349Rta8A7lld0
         Q31BvEKbuIe1T1MkQAYppntrnyVqa8yUMbrkd5uikI4frTxE3j251K/D4L9v2ee9Zb0D
         OQwrQa81MTLpMl+Q+Fef3ZgyLPlucDqRd383lGvIVOoIbVOj1id4ZuuXuXaK+IKOd0wh
         t2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWhOrSVsr8fJy/VuOh4aykEdlopnDCWkJyj0LO2Wy0RUdSFU1zfZ7ELigsZLK6XA5wYq+pkCToti0o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+DjJXmmURI3mz9sGujX+ueuJm0lDUSX0wdmRsAS777uxunz7s
	mWZMEnuJBAoE/s3eXBZrTUr9oc83gZRBsFt1zP0J94miNN24Mjq047Co3WX/aU18dDNhHND04Zu
	sWAZaP03umcdtAbvLW7mVDVYDe2r7X40=
X-Gm-Gg: AZuq6aLp+A8j9BLW7uUFmgvmkPuvDAL7S7S9wjZ9rMyG67/S4c8IJ9GL2CAa3jOlPaI
	UqOhMQdouva3wOCJ6BCC5iQfzgA+1KiNye1hGXx/6GTo22qJ0ijpkQLECEzFz0wV3Tz92MOY5eC
	qVMAlTRfMQujbn400iew4DUDYxKW4BwIbV1upAunTclBTNIXgj22/V/wpW9zOULgF7BMTaJd2Lx
	buBcKIfyNua+ryZQ2Id/HN2P4fG7VQvkXHqKOL1X/GpicfmOOPfC3JgX4iPyrIaIN29C0oqAA47
	EBH0FQME0L7x72cF6k3ydzEdM38OxDhsRZGANLwzJmjZPPiPL9w1TaXpNzc18BDb87tGtKVJI6N
	hZ+BvcyQ=
X-Received: by 2002:a17:906:5ad6:b0:b8f:e424:ae56 with SMTP id
 a640c23a62f3a-b9081badd6emr413937066b.44.1771861895691; Mon, 23 Feb 2026
 07:51:35 -0800 (PST)
MIME-Version: 1.0
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 23 Feb 2026 17:50:59 +0200
X-Gm-Features: AaiRm51McMZohKyigNQFIbQDImiJ8vF_g2F0DjapyVKPe6Rkgx4x17MorqEdw1M
Message-ID: <CAHp75VeWD5A0r7-Uayyte1ZXXxdhLixd+z_y0xNeki0N+Ro=jQ@mail.gmail.com>
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>, 
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Even Xu <even.xu@intel.com>, 
	Xinpeng Sun <xinpeng.sun@intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
	Karol Wachowski <karol.wachowski@linux.intel.com>, Min Ma <mamin506@gmail.com>, 
	Lizhi Hou <lizhi.hou@amd.com>, Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Srujana Challa <schalla@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Antoine Tenart <atenart@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Raag Jadav <raag.jadav@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-i3c@lists.infradead.org, dmaengine@vger.kernel.org, 
	Philipp Stanner <phasta@kernel.org>, netdev@vger.kernel.org, nic_swsd@realtek.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-usb@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org, linux-crypto@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, 
	mhi@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_075138_706389_F8509B78 
X-CRM114-Status: GOOD (  22.49  )
X-Mailman-Approved-At: Wed, 11 Mar 2026 15:01:57 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgNTozMuKAr1BNIFNoYXduIExpbiA8c2hhd24ubGluQHJv
Y2stY2hpcHMuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHJlc3NlcyBhIGxv
bmctc3RhbmRpbmcgZGVzaWduIGlzc3VlIGluIHRoZSBQQ0kvTVNJCj4gc3Vic3lzdGVtIHdoZXJl
IHRoZSBpbXBsaWNpdCwgYXV0b21hdGljIG1hbmFnZW1lbnQgb2YgSVJRIHZlY3RvcnMgYnkKPiB0
aGUgZGV2cmVzIGZyYW1ld29yayBjb25mbGljdHMgd2l0aCBleHBsaWNpdCBkcml2ZXIgY2xlYW51
cCwgY3JlYXRpbmcKPiBhbWJpZ3VpdHkgYW5kIHBvdGVudGlhbCByZXNvdXJjZSBtYW5hZ2VtZW50
IGJ1Z3MuCj4KPiA9PT09IFRoZSBQcm9ibGVtOiBJbXBsaWNpdCB2cy4gRXhwbGljaXQgTWFuYWdl
bWVudCA9PT09Cj4gSGlzdG9yaWNhbGx5LCBgcGNpbV9lbmFibGVfZGV2aWNlKClgIG5vdCBvbmx5
IG1hbmFnZXMgc3RhbmRhcmQgUENJIHJlc291cmNlcwo+IChCQVJzKSB2aWEgZGV2cmVzIGJ1dCBh
bHNvIGltcGxpY2l0bHkgdHJpZ2dlcnMgYXV0b21hdGljIElSUSB2ZWN0b3IgbWFuYWdlbWVudAo+
IGJ5IHNldHRpbmcgYSBmbGFnIHRoYXQgcmVnaXN0ZXJzIGBwY2ltX21zaV9yZWxlYXNlKClgIGFz
IGEgY2xlYW51cCBhY3Rpb24uCj4KPiBUaGlzIGNyZWF0ZXMgYW4gYW1iaWd1b3VzIG93bmVyc2hp
cCBtb2RlbC4gTWFueSBkcml2ZXJzIGZvbGxvdyBhIHBhdHRlcm4gb2Y6Cj4gMS4gQ2FsbGluZyBg
cGNpX2FsbG9jX2lycV92ZWN0b3JzKClgIHRvIGFsbG9jYXRlIGludGVycnVwdHMuCj4gMi4gQWxz
byBjYWxsaW5nIGBwY2lfZnJlZV9pcnFfdmVjdG9ycygpYCBpbiB0aGVpciBlcnJvciBwYXRocyBv
ciByZW1vdmUgcm91dGluZXMuCj4KPiBXaGVuIHN1Y2ggYSBkcml2ZXIgYWxzbyB1c2VzIGBwY2lt
X2VuYWJsZV9kZXZpY2UoKWAsIHRoZSBkZXZyZXMgZnJhbWV3b3JrIG1heQo+IGF0dGVtcHQgdG8g
ZnJlZSB0aGUgSVJRIHZlY3RvcnMgYSBzZWNvbmQgdGltZSB1cG9uIGRldmljZSByZWxlYXNlLCBs
ZWFkaW5nIHRvCj4gYSBkb3VibGUtZnJlZS4gQW5hbHlzaXMgb2YgdGhlIHRyZWUgc2hvd3MgdGhp
cyBoYXphcmRvdXMgcGF0dGVybiBleGlzdHMgd2lkZWx5LAo+IHdoaWxlIDM1IG90aGVyIGRyaXZl
cnMgY29ycmVjdGx5IHJlbHkgc29sZWx5IG9uIHRoZSBpbXBsaWNpdCBjbGVhbnVwLgoKSXMgdGhp
cyBjb25maXJtZWQ/IFdoYXQgSSByZWFkIGZyb20gdGhlIGNvdmVyIGxldHRlciwgdGhpcyBzZXJp
ZXMgd2FzCm9ubHkgY29tcGlsZS10ZXN0ZWQsIHNvIGhvdyBjYW4geW91IHByb3ZlIHRoZSBwcm9i
bGVtIGV4aXN0cyBpbiB0aGUKZmlyc3QgcGxhY2U/Cgo+ID09PT0gVGhlIFNvbHV0aW9uOiBNYWtp
bmcgTWFuYWdlbWVudCBFeHBsaWNpdCA9PT09Cj4gVGhpcyBzZXJpZXMgZW5mb3JjZXMgYSBjbGVh
ciwgcHJlZGljdGFibGUgbW9kZWw6Cj4gMS4gIE5ldyBNYW5hZ2VkIEFQSSAoUGF0Y2ggMS8zNyk6
IEludHJvZHVjZXMgcGNpbV9hbGxvY19pcnFfdmVjdG9ycygpIGFuZAo+ICAgICBwY2ltX2FsbG9j
X2lycV92ZWN0b3JzX2FmZmluaXR5KCkuIERyaXZlcnMgdGhhdCBkZXNpcmUgZGV2cmVzLW1hbmFn
ZWQgSVJRCj4gICAgIHZlY3RvcnMgc2hvdWxkIHVzZSB0aGVzZSBmdW5jdGlvbnMsIHdoaWNoIHNl
dCB0aGUgaXNfbXNpX21hbmFnZWQgZmxhZyBhbmQKPiAgICAgZW5zdXJlIGF1dG9tYXRpYyBjbGVh
bnVwLgo+IDIuICBQYXRjaGVzIDIgdGhyb3VnaCAzNiBjb252ZXJ0IGVhY2ggZHJpdmVyIHRoYXQg
dXNlcyBwY2ltX2VuYWJsZV9kZXZpY2UoKSBhbG9uZ3NpZGUKPiAgICAgcGNpX2FsbG9jX2lycV92
ZWN0b3JzKCkgYW5kIHJlbGllcyBvbiBkZXZyZXMgZm9yIElSUSB2ZWN0b3IgY2xlYW51cCB0byBp
bnN0ZWFkCj4gICAgIG1ha2UgYW4gZXhwbGljaXQgY2FsbCB0byBwY2ltX2FsbG9jX2lycV92ZWN0
b3JzKCkuCj4gMy4gIENvcmUgQ2hhbmdlIChQYXRjaCAzNy8zNyk6IFdpdGggdGhlIGZvcm1lciBj
bGVhbnVwLCBub3cgbW9kaWZpZXMgcGNpbV9zZXR1cF9tc2lfcmVsZWFzZSgpCj4gICAgIHRvIGNo
ZWNrIG9ubHkgdGhlIGlzX21zaV9tYW5hZ2VkIGZsYWcuIFRoaXMgZGVjb3VwbGVzIGF1dG9tYXRp
YyBJUlEgY2xlYW51cCBmcm9tCj4gICAgIHBjaW1fZW5hYmxlX2RldmljZSgpLiBJUlEgdmVjdG9y
cyBhbGxvY2F0ZWQgdmlhIHBjaV9hbGxvY19pcnFfdmVjdG9ycyooKQo+ICAgICBhcmUgbm93IHNv
bGVseSB0aGUgZHJpdmVyJ3MgcmVzcG9uc2liaWxpdHkgdG8gZnJlZSB3aXRoIHBjaV9mcmVlX2ly
cV92ZWN0b3JzKCkuCj4KPiBXaXRoIHRoZXNlIGNoYW5nZXMsIHdlIGNsZWFyIG93bmVyc2hpcCBt
b2RlbDogRXhwbGljaXQgcmVzb3VyY2UgbWFuYWdlbWVudCBlbGltaW5hdGVzCj4gYW1iaWd1aXR5
IGFuZCBmb2xsb3dzIHRoZSAicHJpbmNpcGxlIG9mIGxlYXN0IHN1cnByaXNlLiIgTmV3IGRyaXZl
cnMgY2hvb3NlIG9uZSBtb2RlbCBhbmQKPiBiZSBjb25zaXN0ZW50Lgo+IC0gVXNlIGBwY2lfYWxs
b2NfaXJxX3ZlY3RvcnMoKWAgKyBgcGNpX2ZyZWVfaXJxX3ZlY3RvcnMoKWAgZm9yIGV4cGxpY2l0
IGNvbnRyb2wuCj4gLSBVc2UgYHBjaW1fYWxsb2NfaXJxX3ZlY3RvcnMoKWAgZm9yIGRldnJlcy1t
YW5hZ2VkLCBhdXRvbWF0aWMgY2xlYW51cC4KCkhhdmUgeW91IGNoZWNrZWQgcHJldmlvdXMgYXR0
ZW1wdHM/IFdoeSBpcyB5b3VyIHNlcmllcyBiZXR0ZXIgdGhhbiB0aG9zZT8KCj4gPT09PSBUZXN0
aW5nIEFuZCBSZXZpZXcgPT09PQo+IDEuIFRoaXMgc2VyaWVzIGlzIG9ubHkgY29tcGlsZWQgdGVz
dCB3aXRoIGFsbG1vZGNvbmZpZy4KPiAyLiBHaXZlbiB0aGUgc3Vic3RhbnRpYWwgc2l6ZSBvZiB0
aGlzIHBhdGNoIHNlcmllcywgSSBoYXZlIHN0cnVjdHVyZWQgdGhlIG1haWxpbmcKPiAgICB0byBm
YWNpbGl0YXRlIGVmZmljaWVudCByZXZpZXcuIFRoZSBjb3ZlciBsZXR0ZXIsIHRoZSBmaXJzdCBw
YXRjaCBhbmQgdGhlIGxhc3Qgb25lIHdpbGwgYmUgc2VudAo+ICAgIHRvIGFsbCByZWxldmFudCBt
YWlsaW5nIGxpc3RzIGFuZCBrZXkgbWFpbnRhaW5lcnMgdG8gZW5zdXJlIGJyb2FkIHZpc2liaWxp
dHkgYW5kCj4gICAgaW5pdGlhbCBmZWVkYmFjayBvbiB0aGUgb3ZlcmFsbCBhcHByb2FjaC4gVGhl
IHJlbWFpbmluZyBzdWJzeXN0ZW0tc3BlY2lmaWMgcGF0Y2hlcwo+ICAgIHdpbGwgYmUgc2VudCBv
bmx5IHRvIHRoZSByZXNwZWN0aXZlIHN1YnN5c3RlbSBtYWludGFpbmVycyBhbmQgdGhlaXIgYXNz
b2NpYXRlZAo+ICAgIG1haWxpbmcgbGlzdHMsIHJlZHVjaW5nIG5vaXNlLgoKLS0gCldpdGggQmVz
dCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
