Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C08CD98F0
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 10:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqrGEcERtsHb3Sswi+fHv5VePt4SS+w8wdaH+PE7ndk=; b=yQdpD6abVNwHYN
	AcOOS8R5ezJgtQ2UKaYct4h+NN6AQpJv9GbaWBscXDDaR4Y5CB2/ZICop8V5ZShM1/SJtTPvRd4IC
	C/Z7BM+imnacfJhGLH7soKAmOEmeEqMj6IjDGw1OwDre6FN1lyC87tkv5dTlnMAvaX2E6p4VBrEHA
	O4aQJkLfmu6gyGsp/bHXD7SUFnDHGrmLz+YvV0AsfiqdJhv/omP+tsSnQN0xPjA70zGdFbHm0jnoi
	Y/PZSj76FRnK6uHOFsGaqMHh++PUqnw3BEBbjPpYASitYECIZD27Sq49bvc8LcZ4l2Vq/0m56O9mj
	hy1ULSU/7LC41xibONhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQjO-0000000FZZ7-2oKc;
	Tue, 16 Jun 2026 10:09:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQjM-0000000FZYp-3XuV
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 10:09:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05D5B41950;
	Tue, 16 Jun 2026 10:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E93E1F000E9;
	Tue, 16 Jun 2026 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604555;
	bh=LlxRaBG6eynzLDr/yz1klgDK7E/0N48+pbMMrQAbWNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OwprP4mAR/J7E7R8/ZYl7LEfrHITNYzx5AWBu69tMCeV0K6mjhRzNgWNcQTOA7MDv
	 BBU3z7L30lu/TUKkzM/2A+GSyeEXelLO1G+NKJ5LzjifGI1gpD6TAN1NAbIMwOzJtV
	 VN0fbLxRk/vQjsVFTBMc1yfoZSVgc1z78VBy2TVGmMsyqCDgeOSv4al35jSLQegnUU
	 Ytk38vcGG9d+l1sCsu7MSuSUC9/ZNhTWsPDXpjsJPRdIcRDJNylJaikssa399qrp+l
	 lozX/2Z4ngNUtCrP/IrZi8dT1SMNCJJMq5WnvQnICWrxoQbSBJLARhea2bgP9TGXEL
	 rThWmrK7QOPNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616095429.3947205-10-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-10-akhilrajeev@nvidia.com>
Date: Tue, 16 Jun 2026 10:09:14 +0000
Message-Id: <20260616100915.7E93E1F000E9@smtp.kernel.org>
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

PiBVcGRhdGUgdmFyaWFibGUgbmFtZXMgdG8gZ2VuZXJpYyBuYW1lcyBhbmQgYWRkIFRlZ3JhNDEw
IEFDUEkgSUQgdG8KPiBzdXBwb3J0IHRoZSBJM0MgY29udHJvbGxlciBpbiBUZWdyYTQxMCwgd2hp
Y2ggaXMgYSBEZXNpZ25XYXJlIEkzQyBob3N0Cj4gY29udHJvbGxlci4KPiAKPiBSZXZpZXdlZC1i
eTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWtoaWwgUiA8
YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2gg
YW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjE2MDk1NDI5LjM5NDcy
MDUtMS1ha2hpbHJhamVldkBudmlkaWEuY29tP3BhcnQ9OQoKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
