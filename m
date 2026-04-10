Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6A8EA3C5C
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Apr 2026 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+AXIH1jdYmema909saMMY4bU69F9DpJ7TKTMaGYmtM=; b=M5s8ZJSpqtuWzg
	4S//x25Ry1GnJNShc/svXN5b2DU/pd1uorxlHSqEMr8+8jBUDS1C3mbvPB8bm2iV3w87BESyMZiGS
	KPxjfN6C0q7zQEWYEt0GZ0S/QEh+gn9TmuWvH4spwQNZ46dJpLUlAukXpefaD4wD9J2tz4MhqhcN/
	KugufNqcV7SYAmLrRWQR+BwbDNUckgWs3l/doXI4vLxkKYuIppxzUQfHaNKbG4mgvdMmAoVUMKyZa
	VRVwxqPVTRlXtitrGNyC8LJyXAgYakRjTk3SpJfBghnsa/8Ql3rCeeQ0tQLfpS78C2tCAcw3V0S8Y
	GihhhIT9AywWpLU+vtvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9a6-0000000C330-28Bt;
	Fri, 10 Apr 2026 10:59:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9a3-0000000C32d-3RJQ
	for linux-i3c@lists.infradead.org;
	Fri, 10 Apr 2026 10:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A842A43F9A
	for <linux-i3c@lists.infradead.org>; Fri, 10 Apr 2026 10:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8518BC19421
	for <linux-i3c@lists.infradead.org>; Fri, 10 Apr 2026 10:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775818758;
	bh=+5BeJza8tFJggQKZRXrTb/CvIX3BJmiN7ADIC6ArjTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HHxAwEBVmcrttpwI/SR6I64Sbiaj11QhNyvBcmN6j4aeDaI+qv11vxvItfvG51B77
	 +ypb/SkBko6g0Hq63q962rkii46SiWh2YeSM/kaFdy9k52q82y+A4kd38ASt+1sFTQ
	 jo12amLfxjXWzFa3KNlWveSffbuE04owIcoHkcr5smhZxul73IPqOPIfMVGR9AsD6y
	 YfEoj7gP1V3hZna1ehRcaIipqnrNjzJDtb5c+DA9gc48TfxDjoQ3mcJii4jeXyCE1e
	 83g7vgpPuMXfvhFMfQkdJxGYfE0o5gj6tF/IpwWHWzZVeUH8DRJuiCopO/iJMJCr8g
	 iPBdUQKBa9w0A==
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7dbdcb85067so1586829a34.1
        for <linux-i3c@lists.infradead.org>; Fri, 10 Apr 2026 03:59:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9ccYhqKFfq/+B38JUtgnuaw4xlSZvfpw6nNanujCGYGRgWHiBqvP8EGkzYxBgwGPu6YHtGTFyis0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXRR7iwZZRG96dp0HIZFP5YrvH0u30jHlSSOq63m0L75CK7IHv
	VpylP7mct5HxFS0r+XIdxO1TeB1as5VKgNy4VtaRhILaZn3kPZbUskZoZ6INmkl9ViKZg5rkhWj
	V3vcotdsWcHFFEdg9NxPs6AJrV7t8bqI=
X-Received: by 2002:a05:6820:98b:b0:681:aa84:a8ff with SMTP id
 006d021491bc7-68be5c5f183mr1355226eaf.12.1775818757753; Fri, 10 Apr 2026
 03:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <adhalQxfbMsL3V0T@lizhi-Precision-Tower-5810> <20260410044515.23667-1-akhilrajeev@nvidia.com>
In-Reply-To: <20260410044515.23667-1-akhilrajeev@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Apr 2026 12:59:06 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jW9=VtjyjeoEDTm9hrGKP_BYUeuKCxcKoV-VsvM5otiA@mail.gmail.com>
X-Gm-Features: AQROBzD6jULSRxFPRJ1yn6HfdmojDgv925IrU6md6SEHp_9VWUijmSzMQiuaa9c
Message-ID: <CAJZ5v0jW9=VtjyjeoEDTm9hrGKP_BYUeuKCxcKoV-VsvM5otiA@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource descriptor
To: Akhil R <akhilrajeev@nvidia.com>
Cc: frank.li@nxp.com, acpica-devel@lists.linux.dev, 
	alexandre.belloni@bootlin.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, ebiggers@kernel.org, krzk+dt@kernel.org, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux@roeck-us.net, miquel.raynal@bootlin.com, p.zabel@pengutronix.de, 
	rafael@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com, 
	wsa+renesas@sang-engineering.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_035919_899605_65E6B66F 
X-CRM114-Status: GOOD (  16.25  )
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

T24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgNjo0NeKAr0FNIEFraGlsIFIgPGFraGlscmFqZWV2QG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCA5IEFwciAyMDI2IDIyOjA0OjA1IC0wNDAwLCBG
cmFuayBMaSB3cm90ZToKPiA+IE9uIFRodSwgQXByIDA5LCAyMDI2IGF0IDA0OjI3OjMyUE0gKzA1
MzAsIEFraGlsIFIgd3JvdGU6Cj4gPj4gQUNQSSA2LjMgc3BlY2lmaWVzIGJ5dGUgOCBvZiBJMkMg
U2VyaWFsIEJ1cyBDb25uZWN0aW9uIGRlc2NyaXB0b3IgdG8gYmUKPiA+PiB1c2VkIGZvciBMZWdh
Y3kgVmlydHVhbCBSZWdpc3RlciAoTFZSKSBkYXRhIGFzIHNwZWNpZmllZCBpbiB0aGUgTUlQSQo+
ID4+IEkzQyBTcGVjaWZpY2F0aW9uIGZvciBhbiBJMkMgZGV2aWNlIGNvbm5lY3RlZCB0byBhbiBJ
M0MgSG9zdCBDb250cm9sbGVyLgo+ID4+IExWUiB3aWxsIGJlIHJlYWQgYnkgSTNDIGhvc3QgY29u
dHJvbGxlciBkcml2ZXJzIGFuZCBpdCBwcm92aWRlcyBkZXRhaWxzCj4gPj4gYWJvdXQgdGhlIHNw
ZWNpZmljIHNwZWVkIGFuZCA1MG5zIHNwaWtlIGZpbHRlciBjYXBhYmlsaXRpZXMgb2YgSTJDCj4g
Pj4gZGV2aWNlcy4KPiA+Pgo+ID4+IFVwZGF0ZSB0aGUgcnNjb252ZXJ0X2luZm8gdG8gaW5jbHVk
ZSB0aGlzIGZpZWxkLiBGb3IgSTJDIGRldmljZXMgb24gYW4KPiA+PiBJMkMgYnVzLCB0aGlzIGZp
ZWxkIGlzIFJlc2VydmVkIGFuZCB1bnVzZWQuCj4gPj4KPiA+PiBUaGlzIGNvbW1pdCBpcyB0aGUg
cmVzdWx0IG9mIHNxdWFzaGluZyB0aGUgZm9sbG93aW5nOgo+ID4+IEFDUElDQSBjb21taXQgNzAw
ODJkYzhmYzg0NzY3M2FjN2Y0YmJiMTU0MTc3NjczMGYwYjYzZQo+ID4+IEFDUElDQSBjb21taXQg
ZTYyZTc0YmFmN2UwOGNmMDU5ZWM4MjA0OWFlY2NkNTY1YjI0ZDY2MQo+ID4+IEFDUElDQSBjb21t
aXQgYzQwNDExODIzNTEwODAxMmNhZDM5NmM4MzRiNWFhYmUyZGQxYjUxYQo+ID4+IEFDUElDQSBj
b21taXQgNzY1MGQ0YTg4OWVhNzkwNzA2MGJmY2U4OWY0Zjc4MGNlODNlN2IyOAo+ID4+IEFDUElD
QSBjb21taXQgMDE0ZmE5ZjJkYmNjNmIxYmQ0MmE0YTRhNmY2NzA1ZDljZjdkNDYwYgo+ID4KPiA+
IFRoZXNlIGNvbW1pdCBudW1iZXIgaXMgbm90IGV4aXN0ZWQgYXQgbGludXMgb2ZmaWNpYWwgdHJl
ZS4gUGxlYXNlIHJlbW92ZSBpdC4KPgo+IFRoZXNlIGFyZSBjb21taXRzIGZyb20gQUNQSS1DQSBn
aXRodWIuIFRoZSBmaWxlcyBpbiB0aGUgYWNwaWNhIGZvbGRlciBpcwo+IGEgbWlycm9yIG9mIHRo
YXQgcmVwby4gSSBzdXBwb3NlIHRoZSBjb21taXRzIGluIHRoaXMgZm9sZGVyIGFyZSBleHBlY3Rl
ZAo+IHRvIGJlIHN0cnVjdHVyZWQgbGlrZSB0aGlzLiBUaGUgcHJvY2VzcyBpcyBhbHNvIGRlc2Ny
aWJlZCBoZXJlIC0KPiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kcml2ZXItYXBpL2FjcGkvbGlu
dXhpemVkLWFjcGljYS5odG1sCgpXaGlsZSB0aGUgYWJvdmUgaXMgY29ycmVjdCBvdmVyYWxsLCBp
dCB3b3VsZCBhbHNvIGJlIHN1ZmZpY2llbnQgdG8gdXNlCkxpbms6IHRhZ3MgcG9pbnRpbmcgdG8g
dGhvc2UgY29tbWl0cy4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
