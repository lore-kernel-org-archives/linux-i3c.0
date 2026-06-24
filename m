Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA9ECDB47C
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYQ/FqnerEQNEi2NbypJXz2GEO553kIl2qlpVM3bI1A=; b=u8m1w2EFrsk3YR
	rKfNLB3sEnjzdSieHDBt9Doy+NtCsVv0knDJkq0AnKK6IjxM/0o78urTJkF3M2sTDuK06kqg7wxDY
	cQtnUzBeqWN0kxDWOt6Yi8R4/0e/zy2hLjcAl6GhZN8LsGwu9dQ9xesDfQ2JpcIpSLaLhmd6OGt+M
	eRBS0AFos5UY5czkRBljPXU2YB/MjLuB+SaOLHY/TZtCop1U1uNCic0H87zsp73ijdBvq+DwpOnai
	I3JyZmqBOaXpJKp/TdgzA6BxMCx7OrCv8/D5ZKQXDesPqpZ4d//i9+N6CnpXFunDOXgivZeOBUPiJ
	beFksVruAbt2e2VtqAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKui-00000007c6l-0ECF;
	Wed, 24 Jun 2026 10:33:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKug-00000007c6e-2RWU
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:32:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1653840431;
	Wed, 24 Jun 2026 10:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9728A1F00A3F;
	Wed, 24 Jun 2026 10:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297178;
	bh=i3PjvAWvCu+HGhehWSCeDEa7SQNHF2PmRQbOeDXwBaY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Akpf97PSovw1IDgKPgkABZfadnan+rijVA95HkSvdbj//svrY7KYbNlem2W6xlrEN
	 FLJZHgzc/1ZEm3gKKtDukfZOAtuV6B1FVfCtynhvDC/nCP+S8PLV74CSvfAzbwlTNm
	 4Z0qAESgVaOqsmG8HTSLcWT6X/jlCFFtpebkAhzM+GkR3459T/0omU21+APHaFHljJ
	 Hck04XMYbl5xiNZhoaFQwq/9RsBkQcdwV2u5q+9AU8ggEBmbwc5GFkaG9ClBe2WDMn
	 qZb/shlOnz08IbgqiT1GyWyq4WVnLqwtpeOPkYZMKgwMoVTaVktHqZrG0bSyLvMkLd
	 Fjc0z0uc38NQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260624102153.1770072-10-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-10-akhilrajeev@nvidia.com>
Date: Wed, 24 Jun 2026 10:32:57 +0000
Message-Id: <20260624103257.9728A1F00A3F@smtp.kernel.org>
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
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjI0MTAyMTUzLjE3NzAw
NzItMS1ha2hpbHJhamVldkBudmlkaWEuY29tP3BhcnQ9OQoKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
