Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFD3EA3C23
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Apr 2026 11:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLqsrggcz950GkCB9vX8mnu22vev4C5m/b+52AjHui8=; b=zkFdJuDnPAG9gD
	Qbm56uSE/JQsaT3AZvF+LdW8cHxmZRcwZhYXmWlwK1ApbKrbbxewAmanpFhK5nYEpfjJwO2lM4mC5
	Y3ysF4yWdXInz26JmW2QHbhxnycUerTG++prxkPKlsvuNC7ubiKCX3eqtE8ShNP3fbUoTJf0Z7yE6
	hOa8+X/0zVX0Ao6eZJ4vkFky9/w8AUuxOMGDOJ1bqmrVnOAj+4oNB5nSoRmKa4XyUwfgukw8y1k9T
	HxhC/Inv+jvgqQWd7V50fKtNm1kA610Lt5K8We5/nHf1vTnBCLwaR/NrqCLBDdTadJwEdJtFJzTbb
	vlxj2+BoFQ6X6+pqiB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnEf-0000000AEVO-3EMy;
	Thu, 09 Apr 2026 11:07:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnEd-0000000AEVI-3NE9
	for linux-i3c@lists.infradead.org;
	Thu, 09 Apr 2026 11:07:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0D3D60125
	for <linux-i3c@lists.infradead.org>; Thu,  9 Apr 2026 11:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9666C2BCB4
	for <linux-i3c@lists.infradead.org>; Thu,  9 Apr 2026 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775732862;
	bh=AwjrzL0fh5CEgp6ILuxORU62HOKwb9P8MF8D4O9oX30=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Vk2WBH75rBQxC/rySOUlJ3r+B9mC0vIwFek0r48g+ZonAR2VWYz0pq0yMr+d90VmJ
	 DyRzj9M4KrHDy+BXKa8sunve22IKi3mmHD96UFn6+dF+8GY516m+b6mvg428nMeAZv
	 buoUeWkjxPPxcPmeBWXzkbfH93htPNsqzEFeaPVzYSNiVHL9ffrK5VCiu0797B2w7G
	 UgBut3mqOU45kl96CXw0bO1Erx851OhBk7WQPPBDL8B0KFnUeCyJ2snIe7jCBYMVe4
	 byEsxj+bOGTmnwY6rLP8m5Oi+6/CiSFYCEGWaYjR3vfDGiO/p9dgfBe3usBgKMito9
	 uqBck0c5AtKnw==
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-476448429dfso387039b6e.0
        for <linux-i3c@lists.infradead.org>; Thu, 09 Apr 2026 04:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaQttd7EYsCS0caVS25Ueo1DI4TJ6Gkfg6lyE01MPhh4EP8P971jEGFGSiD6rBnu5I0uiCNgV0o4s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4m7duPe8+N0gULXzwNQ/83kzezGeD8YmHEfoNB6usKRQ/QfJ0
	n2omEQLW/jtjHtCo8TbbqNaITsL5xEZEPw80z260EjeGVRQx4jZiDxQte06/R7h1gWPIRyc4EoX
	Su9YgIO/h0pUbtkncQ+1EjIZ5JFSZej4=
X-Received: by 2002:a05:6808:c2a1:b0:467:70eb:36ae with SMTP id
 5614622812f47-46efb1cf097mr12520225b6e.29.1775732861791; Thu, 09 Apr 2026
 04:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260409105747.48158-1-akhilrajeev@nvidia.com> <20260409105747.48158-3-akhilrajeev@nvidia.com>
In-Reply-To: <20260409105747.48158-3-akhilrajeev@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 9 Apr 2026 13:07:30 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g1-gyReMo4AvtBfth2bDhxJdr+o8rTozJJ0q28RTDGMw@mail.gmail.com>
X-Gm-Features: AQROBzDNvyu9QpULO0jlYjq4hyvVVIYN8TZ7GG9yU-t4nZ37LiVlTgpbMoONhDY
Message-ID: <CAJZ5v0g1-gyReMo4AvtBfth2bDhxJdr+o8rTozJJ0q28RTDGMw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource descriptor
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Eric Biggers <ebiggers@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-hwmon@vger.kernel.org
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

T24gVGh1LCBBcHIgOSwgMjAyNiBhdCAxMjo1OeKAr1BNIEFraGlsIFIgPGFraGlscmFqZWV2QG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gQUNQSSA2LjMgc3BlY2lmaWVzIGJ5dGUgOCBvZiBJMkMgU2Vy
aWFsIEJ1cyBDb25uZWN0aW9uIGRlc2NyaXB0b3IgdG8gYmUKPiB1c2VkIGZvciBMZWdhY3kgVmly
dHVhbCBSZWdpc3RlciAoTFZSKSBkYXRhIGFzIHNwZWNpZmllZCBpbiB0aGUgTUlQSQo+IEkzQyBT
cGVjaWZpY2F0aW9uIGZvciBhbiBJMkMgZGV2aWNlIGNvbm5lY3RlZCB0byBhbiBJM0MgSG9zdCBD
b250cm9sbGVyLgo+IExWUiB3aWxsIGJlIHJlYWQgYnkgSTNDIGhvc3QgY29udHJvbGxlciBkcml2
ZXJzIGFuZCBpdCBwcm92aWRlcyBkZXRhaWxzCj4gYWJvdXQgdGhlIHNwZWNpZmljIHNwZWVkIGFu
ZCA1MG5zIHNwaWtlIGZpbHRlciBjYXBhYmlsaXRpZXMgb2YgSTJDCj4gZGV2aWNlcy4KPgo+IFVw
ZGF0ZSB0aGUgcnNjb252ZXJ0X2luZm8gdG8gaW5jbHVkZSB0aGlzIGZpZWxkLiBGb3IgSTJDIGRl
dmljZXMgb24gYW4KPiBJMkMgYnVzLCB0aGlzIGZpZWxkIGlzIFJlc2VydmVkIGFuZCB1bnVzZWQu
Cj4KPiBUaGlzIGNvbW1pdCBpcyB0aGUgcmVzdWx0IG9mIHNxdWFzaGluZyB0aGUgZm9sbG93aW5n
Ogo+IEFDUElDQSBjb21taXQgNzAwODJkYzhmYzg0NzY3M2FjN2Y0YmJiMTU0MTc3NjczMGYwYjYz
ZQo+IEFDUElDQSBjb21taXQgZTYyZTc0YmFmN2UwOGNmMDU5ZWM4MjA0OWFlY2NkNTY1YjI0ZDY2
MQo+IEFDUElDQSBjb21taXQgYzQwNDExODIzNTEwODAxMmNhZDM5NmM4MzRiNWFhYmUyZGQxYjUx
YQo+IEFDUElDQSBjb21taXQgNzY1MGQ0YTg4OWVhNzkwNzA2MGJmY2U4OWY0Zjc4MGNlODNlN2Iy
OAo+IEFDUElDQSBjb21taXQgMDE0ZmE5ZjJkYmNjNmIxYmQ0MmE0YTRhNmY2NzA1ZDljZjdkNDYw
Ygo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2FjcGljYS9hY3BpY2EvY29tbWl0LzcwMDgy
ZGM4Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2FjcGljYS9hY3BpY2EvY29tbWl0L2IzYzM4
ZGM5Cj4gU2lnbmVkLW9mZi1ieTogQWtoaWwgUiA8YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KCkFj
a2VkLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSAoSW50ZWwpIDxyYWZhZWxAa2VybmVsLm9yZz4gIyBB
Q1BJCgo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvYWNwaWNhL3Jzc2VyaWFsLmMgfCA2ICsrKysrLQo+
ICBpbmNsdWRlL2FjcGkvYWNyZXN0eXAuaCAgICAgICAgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2FjcGkvYWNwaWNhL3Jzc2VyaWFsLmMgYi9kcml2ZXJzL2FjcGkvYWNwaWNhL3Jzc2VyaWFsLmMK
PiBpbmRleCAyNzliZmEyN2RhOTQuLmMwNmU5MThhYjg4OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2FjcGkvYWNwaWNhL3Jzc2VyaWFsLmMKPiArKysgYi9kcml2ZXJzL2FjcGkvYWNwaWNhL3Jzc2Vy
aWFsLmMKPiBAQCAtMzE1LDcgKzMxNSw3IEBAIHN0cnVjdCBhY3BpX3JzY29udmVydF9pbmZvIGFj
cGlfcnNfY29udmVydF9jc2kyX3NlcmlhbF9idXNbMTRdID0gewo+ICAgKgo+ICAgKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqLwo+Cj4gLXN0cnVjdCBhY3BpX3JzY29udmVydF9pbmZvIGFjcGlfcnNfY29u
dmVydF9pMmNfc2VyaWFsX2J1c1sxN10gPSB7Cj4gK3N0cnVjdCBhY3BpX3JzY29udmVydF9pbmZv
IGFjcGlfcnNfY29udmVydF9pMmNfc2VyaWFsX2J1c1sxOF0gPSB7Cj4gICAgICAgICB7QUNQSV9S
U0NfSU5JVEdFVCwgQUNQSV9SRVNPVVJDRV9UWVBFX1NFUklBTF9CVVMsCj4gICAgICAgICAgQUNQ
SV9SU19TSVpFKHN0cnVjdCBhY3BpX3Jlc291cmNlX2kyY19zZXJpYWxidXMpLAo+ICAgICAgICAg
IEFDUElfUlNDX1RBQkxFX1NJWkUoYWNwaV9yc19jb252ZXJ0X2kyY19zZXJpYWxfYnVzKX0sCj4g
QEAgLTM5MSw2ICszOTEsMTAgQEAgc3RydWN0IGFjcGlfcnNjb252ZXJ0X2luZm8gYWNwaV9yc19j
b252ZXJ0X2kyY19zZXJpYWxfYnVzWzE3XSA9IHsKPiAgICAgICAgICBBTUxfT0ZGU0VUKGkyY19z
ZXJpYWxfYnVzLnR5cGVfc3BlY2lmaWNfZmxhZ3MpLAo+ICAgICAgICAgIDB9LAo+Cj4gKyAgICAg
ICB7QUNQSV9SU0NfTU9WRTgsIEFDUElfUlNfT0ZGU0VUKGRhdGEuaTJjX3NlcmlhbF9idXMubHZy
KSwKPiArICAgICAgICBBTUxfT0ZGU0VUKGkyY19zZXJpYWxfYnVzLnR5cGVfc3BlY2lmaWNfZmxh
Z3MpICsgMSwKPiArICAgICAgICAxfSwKPiArCj4gICAgICAgICB7QUNQSV9SU0NfTU9WRTMyLCBB
Q1BJX1JTX09GRlNFVChkYXRhLmkyY19zZXJpYWxfYnVzLmNvbm5lY3Rpb25fc3BlZWQpLAo+ICAg
ICAgICAgIEFNTF9PRkZTRVQoaTJjX3NlcmlhbF9idXMuY29ubmVjdGlvbl9zcGVlZCksCj4gICAg
ICAgICAgMX0sCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYWNwaS9hY3Jlc3R5cC5oIGIvaW5jbHVk
ZS9hY3BpL2FjcmVzdHlwLmgKPiBpbmRleCA4NDJmOTMyZTJjMmIuLjM4YTE5YjFkMTlhYyAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2FjcGkvYWNyZXN0eXAuaAo+ICsrKyBiL2luY2x1ZGUvYWNwaS9h
Y3Jlc3R5cC5oCj4gQEAgLTQyMyw2ICs0MjMsNyBAQCBzdHJ1Y3QgYWNwaV9yZXNvdXJjZV9pMmNf
c2VyaWFsYnVzIHsKPiAgICAgICAgIEFDUElfUkVTT1VSQ0VfU0VSSUFMX0NPTU1PTiB1OCBhY2Nl
c3NfbW9kZTsKPiAgICAgICAgIHUxNiBzbGF2ZV9hZGRyZXNzOwo+ICAgICAgICAgdTMyIGNvbm5l
Y3Rpb25fc3BlZWQ7Cj4gKyAgICAgICB1OCBsdnI7Cj4gIH07Cj4KPiAgLyogVmFsdWVzIGZvciBh
Y2Nlc3NfbW9kZSBmaWVsZCBhYm92ZSAqLwo+IC0tCj4gMi41MC4xCj4KPgoKLS0gCmxpbnV4LWkz
YyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
