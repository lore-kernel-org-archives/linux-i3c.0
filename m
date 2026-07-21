Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B831EC44529
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 04:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/gnVMzPUAgpovNK0zwEKoR1UPzPraCgjDryA84alj4=; b=z0AcBw/LjKVmqf
	JTDqOUSbyF9ruyYaHkNxhTtDHUqE3mqmW7L6NUyiIr3cn8ldaY0u/10aHgWVPURCoPiRoR2z4Xo+D
	/K6P/XNav2b7Ez1Uhb6AYruzsinfVZjzuHq6/DuzDewPxwRfL6SApWegFUpISaCSSjBwBiK8l70Dk
	r7S/e2RX+8R/hfEXzxuFGqemi21RShwp0OykNrdgDgUS87EnuDohNFbxkzL1pNBslRVD3cU8WO1O0
	QOmDF7JcrflisukXwBq/kdpieGgpCuLOOTtMIlDTc1ztk1Q44rTNTQsXBs3OBYKcADwPOlpnO3RmI
	z7F0iru8uO98rE8ktHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm21l-00000008Nad-1sNO;
	Tue, 21 Jul 2026 04:24:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm21k-00000008NaS-17hK
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 04:24:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FC1A400D8;
	Tue, 21 Jul 2026 04:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7431F000E9;
	Tue, 21 Jul 2026 04:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607859;
	bh=WasYGhmexEgnl5aaKe6748Lw6o6Wrzs0MLX9MMw3OzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VioPGtzgTIO1uL6quwDhEZZieZ1/kPWBGoIFMlY6ylak4quYe1lN0k36+3ochZ8Pv
	 kA4A5oZvtcS8bC72ea5g8ESxOrx2q6P0l5cvtq3C7ik6W6VAYnAqFrY+oh1fZNiJsV
	 lY4yOM90s5oaMOdaFiTxinerFupRxrWPokDy6iM3R7K8QwE8u6HNULpf7jdMi921N+
	 73nIX5bgq99LCtKGYaUb5JJ9TSmk6qE5j2coSLrkkL4oEaqRr9qABTs3aoZ9avph5R
	 xt35D8CGv5pQNA4sGLfxusTo20ZMUD4tZ46ZfZIq7eBSg3irgaYXeb6OIGFFwmIDD7
	 49XhPZK/acOvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/12] i3c: dw-i3c-master: Add SETAASA as supported
 CCC
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721040805.1696503-8-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-8-akhilrajeev@nvidia.com>
Date: Tue, 21 Jul 2026 04:24:18 +0000
Message-Id: <20260721042419.0B7431F000E9@smtp.kernel.org>
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
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjEwNDA4MDUuMTY5NjUwMy0xLWFr
aGlscmFqZWV2QG52aWRpYS5jb20/cGFydD03CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
