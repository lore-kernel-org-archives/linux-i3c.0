Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B43C7EE26
	for <linux-i3c@archiver.kernel.org>; Mon, 22 May 2023 08:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAHLildhWeznZK8YO9nBMd/u21Rq/K2vYVRqewPq+PM=; b=TAFCt+BO0tRKZ4
	FIy7MrtCbvZ2mVssotbGUjmOfBvRvouSDlBDAOyxqOsZy6CVDOT2wmO2aZAYi/r0/yyyGlNqEhrQq
	SxMB0qRoVVGg4rrMp1D5qwIXXB0qF8mV89N8cYkWg4KT0/JNy5bEUs8UKjjvMR4+K/wIPbu7QoYxn
	zCyCkYoR1ptp+HJBV9s9F36Z9UFwuwUWqr84IhOHvk3C77AoDHdAuIKoEgjsdUDSE2uKwNOEHpS3Y
	sy656tvmazUJ/uReMU/L3nzN/UwXXlZA4ecSOyoM/pSnlWxrowW6u0tldtMTQEASxUu5AwCasOMYd
	e0bGFmpMJIjoH8QLtnhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q10yG-005l6g-1A;
	Mon, 22 May 2023 08:32:48 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q10yA-005l4u-23
	for linux-i3c@lists.infradead.org;
	Mon, 22 May 2023 08:32:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3B8036000A;
	Mon, 22 May 2023 08:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684744359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qYlvJImxQgTxQhmjZrIEOJ5armogn5whwUCqvvp5jX4=;
	b=Ep5L39gD1OohHdKJiXuAWFEm9SlLz6vEw45jLSHd/epvVXYGPxTYPOxbFqXQ2BlVTL1tgv
	urBgRvAEHg8VEx+mPW44udSJ3qdLaitwui6lkucib5xv20Ma5uH8uyhSgEqnkU9vKggFZR
	0EbR4lqbc7nWj4oih5Wm9g9Ryk4+bsHXbMWpWStM1E8ImzfRaYl1Zhe883+XfNufDmPNhe
	YTFaHabbXzwL8OAX7nGtoDivaZoqdJc4eJZJ+gjksA1aSPuXcKmSDCxoyjauWbgNKgcLNy
	0kD5BJKNL1Plq1EiPpQlp2WTYUb8TtsPFNE+0ym/coHvZ3H/Jkso57fi0iFS8w==
Date: Mon, 22 May 2023 10:32:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: fix cpu schedule in spin lock
Message-ID: <20230522103238.31e17e5d@xps-13>
In-Reply-To: <20230517033030.3068085-2-xiaoning.wang@nxp.com>
References: <20230517033030.3068085-1-xiaoning.wang@nxp.com>
	<20230517033030.3068085-2-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_013242_805861_814B2A6D 
X-CRM114-Status: UNSURE (   6.45  )
X-CRM114-Notice: Please train this message.
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

SGkgQ2xhcmssCgp4aWFvbmluZy53YW5nQG54cC5jb20gd3JvdGUgb24gV2VkLCAxNyBNYXkgMjAy
MyAxMTozMDoyOSArMDgwMDoKCj4gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpIG1heSBjYWxs
IHNsZWVwKCkuIEl0IGNhbm5vdCBiZSB1c2VkIGluCj4gc3ZjX2kzY19tYXN0ZXJfc3RhcnRfeGZl
cl9sb2NrZWQoKSwgYmVjYXVzZSBpdCBpcyBpbiBhIHNwaW4gbG9jay4KPiAKPiBNb3ZlIHRoZSBw
bSBydW50aW1lIG9wZXJhdGlvbnMgdG8gc3ZjX2kzY19tYXN0ZXJfZW5xdWV1ZV94ZmVyKCkuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQ2xhcmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAuY29tPgo+IEZp
eGVzOiAwNWJlMjNlZjc4ZjcgKCJpM2M6IG1hc3Rlcjogc3ZjOiBhZGQgcnVudGltZSBwbSBzdXBw
b3J0IikKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
