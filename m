Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08F2CDB47C
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRX9zbgamNRtYYXGXfcc8SHCrYz+ueAxwcS7cj7cidE=; b=F/uGI9c42t8xqf
	ZZf+pbWCXejFso2mh2N2hSFbPWe3HaxR02cVJCjJE49h80VJDBR136L86cLDGMraL2M1uzk/pFigT
	WMRjYyGx+Iqrfgvo4KZBu/klC86TqK6LdeCX5ox5663NPusDaBoxyuZPOLyGLrDyN8c1bWbMo4C4p
	jSVZrK1VRq7wsuykzdiMSw8PRgGNuyjVeo9RAdpppT2Hj5Pgxg6o3xMrpnS5KVzXiNsGT0Y6oQR9z
	+UzQUE9U6aXvqdMbkwMNcZv+0zYc3tUaU8/DPU1PorEglZSdTTlRRkjUF6q/vA2JPxA+qcb2nnPk6
	SKHJQHevdglP9AjAtwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKvE-00000007c8a-2C03;
	Wed, 24 Jun 2026 10:33:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKvD-00000007c8U-3F4l
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:33:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B772601F3;
	Wed, 24 Jun 2026 10:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683E61F000E9;
	Wed, 24 Jun 2026 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297210;
	bh=QprwepZLXAT5gLHrE6GyGbBtV3tiGZlNVbTYKnjkiTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dNhkwowDOt9/KRWv/v+jfYQ105T376d5r+js8Ad/wMjK6PZeVGhMRB0QjNcx2PPEq
	 bTJGvSiZ9rwmcoGx0YjmlHWqi3hve8XeJoolUjuOSduPy9t0CpJWeHsEU5BxEXRlOd
	 jMAK2oQJ03gutlhdfUdBrSvHGOG61T3o8TAFAEnKMNxrwZQTymOEPNhwZJVb39hhdo
	 xNUJWYVNNoZ+x5MGs/IcXj/nn0BcdnA/o7FtGuW5UsFE4zGYGOfgqwmduzzUD514Ls
	 FdZ0XiKS+nrrqGlIJP4Yo3TWLoxVsxSk51pzVV9nqOObvMVzRMKw0govJXpeNcmPbA
	 LnP9jUw022FQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/12] hwmon: spd5118: Remove 16-bit addressing
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260624102153.1770072-11-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-11-akhilrajeev@nvidia.com>
Date: Wed, 24 Jun 2026 10:33:29 +0000
Message-Id: <20260624103330.683E61F000E9@smtp.kernel.org>
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

PiBUaGUgaW50ZW50IG9mIGludHJvZHVjaW5nIDE2LWJpdCBhZGRyZXNzaW5nIHdhcyB0byBzdXBw
b3J0IEkzQywgYnV0IGl0Cj4gdHVybnMgb3V0IHRoYXQgSTNDIGRvZXMgbm90IHJlcXVpcmUgcmVh
ZGluZyB0aGUgTGVnYWN5IE1vZGUgcmVnaXN0ZXIsCj4gbm9yIGFueSBzcGVjaWZpYyBlbmNvZGlu
ZyBmb3IgcGFnZSB0cmFuc2xhdGlvbi4gVGhlIHRlc3Rpbmcgb2YgMTYtYml0Cj4gY29kZSB3YXMg
bGltaXRlZCBhbmQgdGhlcmUgYXJlIG5vIGtub3duIHVzZXJzIGZvciB0aGlzIGZlYXR1cmUuIFJl
bW92ZQo+IHRoZSBzZWN0aW9ucyB0aGF0IHN1cHBvcnQgMTYtYml0IGFkZHJlc3NpbmcgYW5kIHBy
ZXBhcmUgdGhlIGRyaXZlciB0bwo+IHN1cHBvcnQgSTNDIGFwcHJvcHJpYXRlbHkuCj4gCj4gU3Vn
Z2VzdGVkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4gQWNrZWQtYnk6
IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiBTaWduZWQtb2ZmLWJ5OiBBa2hp
bCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBw
YXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MjQxMDIxNTMu
MTc3MDA3Mi0xLWFraGlscmFqZWV2QG52aWRpYS5jb20/cGFydD0xMAoKCi0tIApsaW51eC1pM2Mg
bWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
