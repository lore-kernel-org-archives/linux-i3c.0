Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E22C54ED1
	for <linux-i3c@archiver.kernel.org>; Sat, 28 Jun 2025 19:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZuPqkGd1XaSNycwBHXGEHxUCQjMubTUPckAtgfVkqs=; b=T7/JKUJHy+sjOw
	tUAWP8sywzIycl8lIz/CdHyQW7avcJoHYgf0BuU6PL2yLqmNZCAbd5O/7OTIQNZXfzu4K6DS0zyFn
	Bw8BiGWVfJeRFiO2F2XOOXCjnwaVGh8wUust27yRv6Y7dAS7hmXacaLPHCOItOAxxleVou8L2D4ux
	nB+8lYZTcITUCzilIogDc3okqB9PN9i/jL24cHlKHN2Y+F8BdVZxok7mjY/RN3L7gpvMzhJFu75b1
	bWjRvvTi9c7he+IdpmKHOvF5xVPaRaNtAxgZrgYDsZ0IWaJeNrcd+1jlC+XoGQ1x7KrcRjUZsPZBZ
	eKUXSFZ8YKQBFly2Sqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVb1U-0000000HF7s-252u;
	Sat, 28 Jun 2025 19:15:36 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVb1R-0000000HF7O-27GI
	for linux-i3c@lists.infradead.org;
	Sat, 28 Jun 2025 19:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LjQo
	ok118qqN+bNtofIrtrY/iZTpUVDCUh2hirZj/sY=; b=W974P+j720wxswbNPI8v
	/LJllYcd6d2Qg2gPCyxWb+RLx+ixXGhx8tCEKSdPs1NsZs2l2NTz1Tu4gdPuDD35
	1gnHbU8LDDshOhM7KsEY4Jo7cXUq1922eRt48HllwbEoqlSGMvdlNLQcx0Dtv/3p
	NfL0ghhdfqHJCHMME+ZsYy1W0+3p7w4Di3InOth2lKJuiBPZ9h9mvTYXGokpvUsf
	N3WYM2zyxU2+OrscyHXzOl4hrs7uLtnnkj9ls5WIp2zddYWDnsUVRP8E94M9KYpC
	1dpiTxV55OSEpZLXHzZTj36ZogPP6zmNL/qX56Op+VDb02bI6hDec3V3fhklBQhq
	Mg==
Received: (qmail 1917549 invoked from network); 28 Jun 2025 21:15:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 21:15:28 +0200
X-UD-Smtp-Session: l3s3148p1@oxoKnqY4bsstnPBw
Date: Sat, 28 Jun 2025 21:15:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2 1/3] i3c: master: replace ENOTSUPP with
 SUSV4-compliant EOPNOTSUPP
Message-ID: <aGA_TxSFb3shGmnO@shikoro>
References: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
 <20250627111755.16535-6-wsa+renesas@sang-engineering.com>
 <aF8DLbPnxLJVDn6t@lizhi-Precision-Tower-5810>
 <aF_AE7H6H_Zb2W0L@shikoro>
 <aGA2DCfUfK5ZN4bR@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGA2DCfUfK5ZN4bR@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_121534_415976_4467C12E 
X-CRM114-Status: UNSURE (   7.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


> I understand this. But the sentence "we never want this(ENOTSUPP) to slip to
> userspace" literal means (I understand at least).
> 
> we don't expect to export it to userspace at all.
> 
> Actually your means "we don't know if it will skip to user space in future"

Sorry, I simply don't understand what you mean here. But I think it is
not worth the time to discuss this further anyhow. I will just use your
suggested commit message. It is not that important.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
