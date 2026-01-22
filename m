Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A3FD6261F
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Jan 2026 12:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z25qxH7h+6UBQsOxOsz6FyIrgaHHMaV3n5V+5YzfcgE=; b=RZokqRjs+iPLF0
	H22D7RXDHQoKQutNNwQ9Iz2tqM3gG539kGyRWK5UCwr3x5hxxT9RYgSo+nPXCmmygqW4iuKOLHd0S
	WygJU+ovKzXKh/k5MFel7ZiSSwvPXNmgOar1m8ReA/RnjL74LcJ+vZFqFRU3Ez4RxdRQ8MfmdevyD
	bBgsT/LHdoTjjIBL+jiYED+OF9hzbTNy8YV+D8qe36h6gJPwau123PdqatkXevKBD+wOmtQ7Xifg3
	8OA/4sp0IiznJldMKmZetXDdd4p5XZTqkQ7d6IggmImjCBZWMaBbSptpZQpIpM+X3iplUGu0MB2c9
	/+nF8PxVVCugcUUbviYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuBb-000000075ik-1BSO;
	Thu, 22 Jan 2026 12:53:19 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuBX-000000075gX-0Eb6
	for linux-i3c@lists.infradead.org;
	Thu, 22 Jan 2026 12:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=kYHg6cThuMYComAfsAoFF1c6tP6+eHK5PT/hDG9/I
	Ko=; b=JnDdtiU0akG7A4VRaWTTr/dPU/Svqsbl30rTaarUNFKwdWVyAy5dNIigg
	hOMmcj90MaS1hnElN1LKgvGfzO9VJRoUNg7JCu3YXlmB4lqaEf8i9LbCAVaLihOj
	41lkMWII7L9z9dtGlG5r0+H1UWQiw/McbJigCDd/PUvjuB6woTxlUfIAHJJ6XM+A
	re24/mKFCkLUMqwAX9EikhrDuoCZsmWCN1EUGvznh2M8E175O2qpABOtfW0xcyDK
	venLxX2qqMtaSNugVxkQ6ZiQBR55gRKFRWz5tMz8PYyW66Df+2X+UTs3J7gALurD
	LXF8zLrNO0wpjFVwNyJwxGk5FVjZg==
Received: (qmail 988934 invoked from network); 22 Jan 2026 13:53:06 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jan 2026 13:53:06 +0100
X-UD-Smtp-Session: l3s3148p1@2hWjhflIdrcujntl
Date: Thu, 22 Jan 2026 13:53:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: David =?utf-8?Q?Nystr=C3=B6m?= <david.nystrom@est.tech>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Add WO sysfs option to re-DDA bus.
Message-ID: <aXIdsGgHQQPKy4Ok@shikoro>
References: <20260122-i3c_rescan-v1-1-0c17071e232b@est.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122-i3c_rescan-v1-1-0c17071e232b@est.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_045316_076306_FC4F4C9F 
X-CRM114-Status: UNSURE (   5.50  )
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

T24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMTI6MzY6MzBQTSArMDEwMCwgRGF2aWQgTnlzdHLDtm0g
d3JvdGU6Cj4gQWRkIGFiaWxpdHkgdG8gcmVzY2FuIHRoZSBpM2MgYnVzIGZyb20gdXNlcnNwYWNl
LCBpLmUuIHByb3Zva2UgYSBEREEuCgpZb3VyIGFyZSBkZXNjcmliaW5nIHdoYXQgeW91IGRvIGJ1
dCB3aGF0IGlzIG1pc3NpbmcgaXMgd2h5IHlvdSB3YW50IHRoZQpjaGFuZ2UuIFdoYXQgaXMgdGhl
IHVzZSBjYXNlPwoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
