Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E344CC44529
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 04:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btrqPJKMOhYQCkyK/mxqrTy9Wiang4M03ytQ70+Tueg=; b=HGeAKyFJCzKHif
	jR+b2yp5Z315XSXg+kIBVq1u4nn6kPxBQ8j7L4mxVI7dgyzjANvQSRa8kfwC16F3bcwaV9ttAGEyE
	q0dHnCPn6QwFBL/hbd/Ul3Gmif4O4bIK2qECvQbeToFQMQ91g4yb8n/CSMn9PbdMfgYfuTUU9duC8
	GSYgigKABv3joFKvhqtxKaac9fps8mL2Q2Nd9j75+zXWJqXO3EM1VE9FmvLJCBeUFCNc3T1On0EU1
	OX7gabrKsRwE5KXLHakHYKEueZGnEIpiUTR2m7NxEzsmWdjL249SENXglNr8uQ5JA02U6qdx4MSvv
	CBJXudRozvEyGV/75ajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm22h-00000008Ngm-2VzM;
	Tue, 21 Jul 2026 04:25:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm22g-00000008NgV-0era
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 04:25:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E629F4177F;
	Tue, 21 Jul 2026 04:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847D51F000E9;
	Tue, 21 Jul 2026 04:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607917;
	bh=syxqgBek8SlSnen0yuAOQ5cVoxUV4ktjsKi5+0pycbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5jgO0XvYnsfC6VcH8nW4u9dmPoD0sIuaQt43XJJj0bxaZADuvTVyZommLoE41DGN
	 mPCI0N6R84xW/6HCuwhXceTZRaEsJsGcHgSfYTJXaF2sFNK++xt0HRbO4M/ra1uRkC
	 rHPIKIhRmZBomeQQZb7YPMq6rlT0McO7PMrRAghX1i8fA8kbdEToX+sXhEGhafxecu
	 siBJyHjPeFgIkkUpMLPDemt2kfeCRUljFpeC8PhMb3gMu491SalMQFgGpobfKhIC4Q
	 FPmjpHOGoMc234LrQphJFi08r+d3Yw6KbzrURyRFODODxxy3HgZZfegjcpv9+R89Y/
	 BojpuCUqKWN0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/12] hwmon: spd5118: Remove 16-bit addressing
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260721040805.1696503-11-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-11-akhilrajeev@nvidia.com>
Date: Tue, 21 Jul 2026 04:25:17 +0000
Message-Id: <20260721042517.847D51F000E9@smtp.kernel.org>
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
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjEwNDA4MDUu
MTY5NjUwMy0xLWFraGlscmFqZWV2QG52aWRpYS5jb20/cGFydD0xMAoKCi0tIApsaW51eC1pM2Mg
bWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
