Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D62ECCD194
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Oct 2025 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEUZz7tl8M1vtGF6CwixceepknvLpyOgM5pIBAmZZeo=; b=u7GmzTN482xGN5
	hShWxum1F95R0a2c9UQ4G9Wcd2zjY0Y3cefjNpdF69JSrDxS1IncWwGPwbLKqtMFpJvK4UdRv2s7+
	SMtLBLxwCiDkzoJEXWip7QXerIx45VsDG8VAif4zmVaKantzm0E6NgFdUfp8NOOLgCcJEVwKmcInF
	XbavaMOsYEF3Znq03WGu3Uqx5At232RtRI7Z3k0VxTR4yqEfVg/Z+hmzfOzJCfUyUqmJLNXizFfrI
	6pYSECHtbAdSQsUoxbbvgx8F48awHjSs3vN0Wj1c8lZgydgp7jPhWHw9xEfGw9hJ/pYnQZhiwhE0u
	FmOFpr8fmzaBEWymzvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93ex-0000000293R-3iee;
	Wed, 15 Oct 2025 15:43:27 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93ev-0000000292k-3URE
	for linux-i3c@lists.infradead.org;
	Wed, 15 Oct 2025 15:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760542982; x=1761147782; i=markus.elfring@web.de;
	bh=QZDoFK1NTUD8QdgGwQHs+Dk1cuLqUd4RxSwfnfLWmMw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aWUO9EWijy/42Cluu+MwUSm9X4UeasL3OpWLgrCZGZbS/ZSkaM+NwoV1WR491fOV
	 WuFAhFN0VN4H3NwN6W+ImnZ2vnMt8yESs/NTF9TfxLESOLX3KCSB6+wp595nw750Y
	 yLQlHjtlRX+d7TIp6ZvU3xlpag8bFhj1mYbCCsjdmi0IoyZlZh7A4b2sGm7/YOfdD
	 FJ8Pwif9nV8AjgTlGNy8BGFXlohh224hTYQj3xMbXg5FzB4zRtC+dnxthwiz6GEGG
	 8XwxHdSyIIQMpJWOk+tt2zBThhbhfib7GBjSlxq39xQRBZ+ifd/tp9Z1Wz/hRrX7y
	 Tobq4txcMUe/+YJU2w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.181]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsJP4-1uFJhk1CyQ-00tz9C; Wed, 15
 Oct 2025 17:43:02 +0200
Message-ID: <af3b4b18-ab6d-4d6c-8a1f-1c90c8744ec9@web.de>
Date: Wed, 15 Oct 2025 17:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
 imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Shuhao Fu <sfual@cse.ust.hk>
References: <20251014162824.2324333-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] i3c: fix refcount inconsistency in
 i3c_master_register
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251014162824.2324333-1-Frank.Li@nxp.com>
X-Provags-ID: V03:K1:W/RRhwjCgbZGkqjRQr/xmgwiTQgevNASJJKBC+jVROEgrTsW+y3
 ZoC/iy05ZPskZcKMW25GuENnIVGdR1oHpUpJITiOpYR7XBDkPiJF/Y02Cs1aOi14t0fgnsR
 G4XpzDCnYo0RtfBSN0fOqc/S3bQdQDZsQwJEP7zWB9D5Y/MHIb5O/SurIsCnasKse6nzl6F
 5WZ632me1kj0Ozv+rwJGw==
UI-OutboundReport: notjunk:1;M01:P0:xUAWHNbcVUM=;tuaagL1GYLq0zCf5qkGgVtMgtiY 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_084326_165724_899FB100 
X-CRM114-Status: UNSURE (   3.18  )
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

PiBJbiBgaTNjX21hc3Rlcl9yZWdpc3RlcmAsIGEgcG9zc2libGUgcmVmY291bnQgaW5jb25zaXN0
ZW5jeSBoYXMgYmVlbgo+IGlkZW50aWZpZWQsIGNhdXNpbmcgcG9zc2libGUgcmVzb3VyY2UgbGVh
ay4K4oCmCgpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIGFkZCBhbnkgdGFncyAobGlrZSDigJxG
aXhlc+KAnSBhbmQg4oCcQ2PigJ0pIGFjY29yZGluZ2x5PwoKUmVnYXJkcywKTWFya3VzCgotLSAK
bGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
