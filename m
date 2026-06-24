Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CA4CDB47C
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRVXKPstENnd277O29DixAygNCzkQHNpt/JlpXovG20=; b=Nj7was/G4/BrLQ
	Xo8Lk1pGW+Rzx9YQdYyloUoMslQIC3EFfX7oB2wnv5GqJa18irmYVL+hfWx05rJkvTshNa4InwddT
	bV0CqBt/OwqC/t62NNum7QksKA1QYiL8lndwjWK4gnJWHF+90P8KxgleTIuPPP80/Y1Hr/QepA652
	lPhhGGOFfYgk6K8ae17jnFnSI3UVL3K2lsw8Oxf36xcjXHR1oimdYK4A2sO2y3AxX6hP4KJ3EFx7F
	dBheXTNY5gxomgSOsQZgnaPbtnjxDAOj+3xLBBnfQLxO6JGwcBHO6PFZTirqbYLX8KPDMX4e5lp6A
	rh4FvGLKazjPnNJOb4Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKwT-00000007cC2-2qiM;
	Wed, 24 Jun 2026 10:34:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKwS-00000007cBm-3MEo
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:34:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28D5660018;
	Wed, 24 Jun 2026 10:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843941F000E9;
	Wed, 24 Jun 2026 10:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297287;
	bh=5u2mB94KU/2aCCKO6pwMVLkSA/uhHZfjjiATcfwE2bw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iyV62ObDp4dxEdmUYA4X5Oh8V+3WtK+NzB731X8YQLYaiVth+7mKwGvHUWpqwOTp0
	 mVmlbiP/Gd19+e3Fv5KtIoSj5BjINeJXguO0943jJGLOa7fqB6dh/1SwF1DYNDHqer
	 lQ22As/S1pEMzjjPSDeshMWENWqU0OkqNaH31RKbCmXYg6HyXLLeWXGHaI1MMdcUag
	 +ae2jYtIkFYYXgtDrQYGf1beZgYh417ns1GpCbAzabH1g7tQT6GAD35Z2vHnTLkss7
	 nb3ccWo14soBr/Rx+EROnAF4Z6z+/2YpcbKlJfiE5fhHMtzGOD6X5v2cZagkwySSDT
	 9HM0JUauCfSaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/12] i3c: dw-i3c-master: Add SETAASA as supported
 CCC
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260624102153.1770072-8-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-8-akhilrajeev@nvidia.com>
Date: Wed, 24 Jun 2026 10:34:47 +0000
Message-Id: <20260624103447.843941F000E9@smtp.kernel.org>
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

PiBBZGQgU0VUQUFTQSBhbmQgU0VUSElEIHRvIHRoZSBzdXBwb3J0ZWQgbGlzdCBvZiBDQ0MgY29t
bWFuZHMgZm9yCj4gRGVzaWduV2FyZSBJM0MgaG9zdCBjb250cm9sbGVyLgo+IAo+IFNFVEFBU0Eg
aXMgYSBicm9hZGNhc3QgY29tbWFuZCB0aGF0IGFzc2lnbnMgcHJlZGVmaW5lZCBzdGF0aWMgYWRk
cmVzc2VzCj4gdG8gYWxsIEkzQyBkZXZpY2VzIG9uIHRoZSBidXMuCj4gCj4gU0VUSElEIGlzIHRv
IHN0b3AgSElEIGJpdCBmbGlwcGluZyBieSB0aGUgU1BEIEh1YiB0byB3aGljaCB0aGUgU1BEIGRl
dmljZXMKPiBhcmUgY29ubmVjdGVkLiBJdCBpcyBhIHByZXJlcXVpc2l0ZSBjb21tYW5kIHRvIGJl
IHNlbnQgYmVmb3JlIFNFVEFBU0EgYXMKPiByZWNvbW1lbmRlZCBieSBKRVNEMzAwLTUgYW5kIEpF
U0Q0MDMgc2lkZWJhbmQgYnVzIHNwZWNpZmljYXRpb25zLgo+IAo+IFJldmlld2VkLWJ5OiBGcmFu
ayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJh
amVldkBudmlkaWEuY29tPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91
bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MjQxMDIxNTMuMTc3MDA3Mi0xLWFr
aGlscmFqZWV2QG52aWRpYS5jb20/cGFydD03CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
