Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D8DC5AC7A
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 15:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k53yyiv7r7UT3Bmi0910G2yVO0+0CKmezZuy4WYYszA=; b=UognMInDFi03Hf
	SI64coiFKktEdYtDTLORtNh6YhQ3I8VpBjDRxsOpiPHVUpOTL3Q9RGXt6t42tfWN/vUbPhw6AS4X7
	XSgJtpIAFnJZWWagTCtxTpswHsLmm9UfLMoLhJ8NZ/6/drJZ7KWluQVCR2Zf0iCqj26MJ8/jKHtV5
	l/ZT9btV40m9l2pvt/AePtCsokMMhKcLghkR/BzR30/FMkw0PMielVKPba7e9soc5fzLfTi1Fk1fD
	xQlfvKNSsKfRRKvxJmo3LZZDoMmc+72HGOONKS628+xuE8yXDzzTjYT+eIBm8QpHQ2WKSxM97BJ6N
	kFM0cXEgChucIghLepCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMIm-00000008KBd-2krF;
	Fri, 07 Aug 2026 15:16:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMIl-00000008KBX-2S3I
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 15:16:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A3C341B65;
	Fri,  7 Aug 2026 15:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D961F00A3A;
	Fri,  7 Aug 2026 15:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786115763;
	bh=KY0NEkj/Rulh+PD6YEpckuZvgjn4vcDmUDiCDW8ESgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XprmG3oUx2Hi8BB2y/Qz3UGzJ1leWIdTcdxWOIvO6OY2pqGnaUkdiCK0XHMNDfbpc
	 hrbWydjIYYC0KV5i8ss2YbLnjMnRgNN7CJAs+hSmRKZfDvn6jJETRMWyDlpvKNLUuY
	 dstvc0lLs0HwxT4e35niNMI7z3u5P1yC0QmxT0OvEZ8uW8vZdfik61NrjpDP75S5vV
	 z36GjH8LpofJpJQLhvBL1wOYZAsnlosm6MoGyPSesA20MGuonF+OKNTOPGb/oAzNJ7
	 +f4Trv4EYkGRja9EIhkn/UKkL0yAVAQJUvwQinTFL6xwk+RuC37n8lqyoU04QeZbxM
	 Mhj9lZP66mxyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 08/14] i3c: master: Support IBI-based wakeup
 capability
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-pci@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260807145638.168865-9-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-9-adrian.hunter@intel.com>
Date: Fri, 07 Aug 2026 15:16:01 +0000
Message-Id: <20260807151602.42D961F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

PiBBbiBJM0MgY29udHJvbGxlciBhY3RzIGFzIGEgYnVzIGNvbnRyb2xsZXIgZm9yIG9uZSBvciBt
b3JlIEkzQyBkZXZpY2VzLgo+IElmIHRoZSBjb250cm9sbGVyIGNhbiB3YWtlIHRoZSBzeXN0ZW0g
aW4gcmVzcG9uc2UgdG8gYW4gSW4tQmFuZAo+IEludGVycnVwdCAoSUJJKSwgdGhlbiBhbnkgZGV2
aWNlIG9uIHRoYXQgYnVzIHRoYXQgaXMgY2FwYWJsZSBvZgo+IGdlbmVyYXRpbmcgSUJJcyBjYW4g
cG90ZW50aWFsbHkgYmUgdXNlZCBhcyBhIHdha2V1cCBzb3VyY2UuCj4gCj4gQWRkIGFuIGliaV93
YWtldXAgZmxhZyB0byBzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyIHNvIGNvbnRyb2xsZXIK
PiBkcml2ZXJzIGNhbiBhZHZlcnRpc2Ugc3VwcG9ydCBmb3IgSUJJLWJhc2VkIHdha2V1cC4KPiAK
PiBJZiBzZXQsIG1hcmsgSUJJLWNhcGFibGUgSTNDIGRldmljZXMgYXMgd2FrZXVwIGNhcGFibGUg
d2hlbiB0aGV5IGFyZQo+IHJlZ2lzdGVyZWQsIGFsbG93aW5nIHdha2V1cCBtYW5hZ2VtZW50IHRo
cm91Z2ggdGhlIHN0YW5kYXJkIGRldmljZQo+IHdha2V1cCBmcmFtZXdvcmsuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgpTYXNoaWtv
IGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdy
ZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDgwNzE0NTYzOC4xNjg4NjUtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0
PTgKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
