Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47425EEB596
	for <linux-i3c@archiver.kernel.org>; Wed, 13 Sep 2023 06:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jm/z0GYVULF8yk+5QZjA29fTz0UWvnATA343TdTAGdw=; b=nKvjTlubL/GRG/
	iXBWOdF7pzOTK8vKnhApaAzzJ2oq8vedYTvZj12nlfT7H8RzAIXGGwZIHjSJD3gqH7mWo0B+GXG13
	XA1PSlsJp9Q7FKQp1/Jy7uSR5NV0X18NEe3f8CiAQBX9Q+5KggpH6Q6BUoijl2YeyzzAwLWfhqdH9
	s7G37H7ogANBdhrkiU9+ukmtZoUAN5M8AOVLlEa7GqemgCsNyqrWD3pidnbK6lYAQ2lCZ4xml1YGj
	YPA+fIfiwEOBABUg56mWtc16HEuPIrIxLse0GrD0w8sKLRqGxgwpbkcKmCxMDyYeU/G3nhkKcE2FM
	oMqz48v4T7xciTs030Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJah-004puS-22;
	Wed, 13 Sep 2023 06:43:11 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJad-004psS-37
	for linux-i3c@lists.infradead.org;
	Wed, 13 Sep 2023 06:43:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8A52E0005;
	Wed, 13 Sep 2023 06:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694587385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ea7k9WOLK3tR/MQAggc+PLYXhMIIJtMQ+lzPVjE+cg0=;
	b=HgfplnX22m1hVcMaY8EbaIfiFFjikEywwY94FdmPmRVtwjvHOEgfgxiwFOS6Gpo1Cz52bA
	2f1hPn9xwdZLPv4+94PB8i9u1dTdE9i36jJ7gFbZGQA3hWX+HOY8FFYSW6j6FKenU/3o9u
	5u7OBQiLYVjyoBSZt1wAwY2ysvbiSuGwSO0fM5NOI5cUXXQTTvAS2Pe4W0imz8pg5+RKFz
	ux7Ja2fQAdTxQfagMZl7oyOFHRCM1TB35c9AZp/mLHALOrLS129j7Vu3MO/OwmrqQ/pYV9
	gYhxhfXKNeYA3XJoVYi0MDzei1yKwTisSlXeups9APKxU36hXbhDdOcnjdyJwQ==
Date: Wed, 13 Sep 2023 08:43:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: <pgaj@cadence.com>, <alexandre.belloni@bootlin.com>,
 <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] i3c: master: cdns: Fix reading status register
Message-ID: <20230913084301.6b2191c2@xps-13>
In-Reply-To: <20230913031743.11439-2-joshua.yeong@starfivetech.com>
References: <20230913031743.11439-1-joshua.yeong@starfivetech.com>
	<20230913031743.11439-2-joshua.yeong@starfivetech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_234308_287546_D205BF53 
X-CRM114-Status: UNSURE (   6.33  )
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

SGkgSm9zaHVhLAoKam9zaHVhLnllb25nQHN0YXJmaXZldGVjaC5jb20gd3JvdGUgb24gV2VkLCAx
MyBTZXAgMjAyMyAxMToxNzo0NSArMDgwMDoKCj4gSUJJUl9ERVBUSCBhbmQgQ01EUl9ERVBUSCBz
aG91bGQgcmVhZCBmcm9tIHN0YXR1czAgaW5zdGVhZCBvZiBzdGF0dXMxLgo+IAo+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IDYwM2YyYmVlMmM1NCAoImkzYzogbWFzdGVyOiBB
ZGQgZHJpdmVyIGZvciBDYWRlbmNlIElQIikKPiBTaWduZWQtb2ZmLWJ5OiBKb3NodWEgWWVvbmcg
PGpvc2h1YS55ZW9uZ0BzdGFyZml2ZXRlY2guY29tPgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51
eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
