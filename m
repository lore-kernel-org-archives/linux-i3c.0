Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADF3C433F5
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Feb 2022 19:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbLrVkcPntqpGX9at1ohz0yMrfcWagWv81Ccj9YppZs=; b=uA+RqPAhQMJvSF
	2JtBSh+IDqNFIROHUxK0F8I3NKYeXEC7bxNw2dDzowgIaeeTDRi2lblJdLG/Gz1bAnuCfi1jR6Yow
	VPOjreWufz/GvsId3c0dKPFhUQPc8YHJpHVSMexosMb9Nq4X7eyLcWLWuAC0g2uqFjFPgNJpRsZhf
	cyLVdmMw7IbZEJwzuNepSzVBqS+Z31R0BqSaXjnXOiF+0PyyURxcdUzZZawQwfcNQwhzdE/OvVxuv
	UWF8x3hmCDBteuNyVXsW2/P+E0ZZAMAEQkuS6R6kiRN8iJ/lW/mcn/cZpaZPMpJf5X6jkBCfjOsuy
	pStIUgZcKfTZrc0B4z6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK3Gq-004FTY-82; Tue, 15 Feb 2022 19:13:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK3Gc-004FMR-Lw; Tue, 15 Feb 2022 19:13:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2784BB81C66;
 Tue, 15 Feb 2022 19:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA149C340EB;
 Tue, 15 Feb 2022 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644952415;
 bh=aWKfLj+OcuQ7ORm2NzKcSLdWPXwTMvCyCCSlhItZJdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pb9b+lIl3czsbILZx4JGaHKfxai5nhmkbafSdXIePkm1+42+PtZWRvtnxsIxieHjT
 9ekyHuwvisvcr9fVX07+lClUNa2p0vhktIvKZSAjwuXs2gg0KwuzJxVI1eJwsCEsx9
 QAqj6xuEKLMkpaRxHB9Jbh5UZNn3lhP/U/32rVpI9FJi1e5LJ0Z2HLVW0p7KctTIZB
 uH0ohVDX/Qm561zC5FzYDM+alYJWObfXnSGwWXg348TFcT9AqtFzE3U54RAksJmBj5
 t03G17WjapCI9e95mge26r6O7cubp0cNepLCQdTnroGWEV76h8vqtZwzBmUYMX3S66
 UcWCeciahTo0A==
Date: Tue, 15 Feb 2022 13:21:10 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com,
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 sparmaintainer@unisys.com, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-ext4@vger.kernel.org,
 linux-acpi@vger.kernel.org, devel@acpica.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 greybus-dev@lists.linaro.org, linux-i3c@lists.infradead.org,
 linux-rdma@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
Message-ID: <20220215192110.GA883653@embeddedor>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202202151016.C0471D6E@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_111338_882572_2FA7C4AB 
X-CRM114-Status: GOOD (  17.62  )
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

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTA6MTc6NDBBTSAtMDgwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IE9uIFR1ZSwgRmViIDE1LCAyMDIyIGF0IDExOjQ3OjQzQU0gLTA2MDAsIEd1c3Rhdm8gQS4g
Ui4gU2lsdmEgd3JvdGU6Cj4gPiBUaGVyZSBpcyBhIHJlZ3VsYXIgbmVlZCBpbiB0aGUga2VybmVs
IHRvIHByb3ZpZGUgYSB3YXkgdG8gZGVjbGFyZQo+ID4gaGF2aW5nIGEgZHluYW1pY2FsbHkgc2l6
ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1lbnRzIGluIGEgc3RydWN0dXJlLgo+ID4gS2VybmVsIGNv
ZGUgc2hvdWxkIGFsd2F5cyB1c2Ug4oCcZmxleGlibGUgYXJyYXkgbWVtYmVyc+KAnVsxXSBmb3Ig
dGhlc2UKPiA+IGNhc2VzLiBUaGUgb2xkZXIgc3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVyby1s
ZW5ndGggYXJyYXlzIHNob3VsZAo+ID4gbm8gbG9uZ2VyIGJlIHVzZWRbMl0uCj4gPiAKPiA+IFRo
aXMgY29kZSB3YXMgdHJhbnNmb3JtZWQgd2l0aCB0aGUgaGVscCBvZiBDb2NjaW5lbGxlOgo+ID4g
KG5leHQtMjAyMjAyMTQkIHNwYXRjaCAtLWpvYnMgJChnZXRjb25mIF9OUFJPQ0VTU09SU19PTkxO
KSAtLXNwLWZpbGUgc2NyaXB0LmNvY2NpIC0taW5jbHVkZS1oZWFkZXJzIC0tZGlyIC4gPiBvdXRw
dXQucGF0Y2gpCj4gPiAKPiA+IEBACj4gPiBpZGVudGlmaWVyIFMsIG1lbWJlciwgYXJyYXk7Cj4g
PiB0eXBlIFQxLCBUMjsKPiA+IEBACj4gPiAKPiA+IHN0cnVjdCBTIHsKPiA+ICAgLi4uCj4gPiAg
IFQxIG1lbWJlcjsKPiA+ICAgVDIgYXJyYXlbCj4gPiAtIDAKPiA+ICAgXTsKPiA+IH07Cj4gCj4g
VGhlc2UgYWxsIGxvb2sgdHJpdmlhbGx5IGNvcnJlY3QgdG8gbWUuIE9ubHkgdHdvIGRpZG4ndCBo
YXZlIHRoZSBlbmQgb2YKPiB0aGUgc3RydWN0IHZpc2libGUgaW4gdGhlIHBhdGNoLCBhbmQgY2hl
Y2tpbmcgdGhvc2Ugc2hvd2VkIHRoZW0gdG8gYmUKPiB0cmFpbGluZyBtZW1iZXJzIGFzIHdlbGws
IHNvOgo+IAo+IFJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4K
CkknbGwgYWRkIHRoaXMgdG8gbXkgLW5leHQgdHJlZS4KClRoYW5rcyEKLS0KR3VzdGF2bwoKLS0g
CmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
