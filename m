Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216BBC54ED1
	for <linux-i3c@archiver.kernel.org>; Sat, 28 Jun 2025 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wE9ihJk70j2NxLeCwzYgk6WeOS1qV7kGXZRi6xQAQbM=; b=he+n5e5KVgZi5n
	0eX1XYhdMQony6atdmiId/nfMWhGDlFhqyJ3FCqjaB/1IBSmhPN5hu05At5QCWeAG2gEm5M7ogSKr
	MzJgRvvje4PIABehLwNqtNdbckwUA8CcK8zyA8M1IfIgTHiv/DMh73xIKWstGNplt6km8pKi0OI+4
	HGXLvz+21RRZ6+skygZXxMhNOLZzE3w7mf8u0r5z/L1aLvK7A12SWJhkcmXOQccOOKtFKe20zqfM2
	Vw1HD1pHRp7lG8dpeYRG6SknmcXOu/7tVlNCd5Dxfjs1cvLTrxsrmSIIl6narpxYzmFkeAxY12Ch8
	9ZvEvhCP1MZNFgJsK+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVSY7-0000000Gg3T-3efj;
	Sat, 28 Jun 2025 10:12:43 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVSY4-0000000Gg3A-0M0Y
	for linux-i3c@lists.infradead.org;
	Sat, 28 Jun 2025 10:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wTWl
	1hOWh4B3xN1pG+EnUVjAd8XJxoLiQvIbOalhFUY=; b=a8G61kAqKjbjRtgkX2r3
	2d/X9OnHa8vHgKhFhpFUnIir8HjAigDHQeoBC5L3ps0opq7EzltVAQNcNG+kQKhq
	uctvgajQGt6mahiOBH3KiMmsYHmp5GNfz+TJbvW2LxVAl+FVpZjIjrZmCax5Whfd
	n2M8uVH3ObtUm0vXns0ZYoM2c2v81ceoYcEnJUBYshjPyhLIiL1TOpucRJFCnc38
	Pv9foNEfvvWLlq7utFxPR+RTVKVICQAAGn86w+HeiNfBc7n+RSOswwJZuJY8LGnR
	kf7ptVRwHXKGRJDOrxYrzNGlYy7LxQAHB5qziFIw8xbo7wZdfkLSChACH8/UMdXL
	MA==
Received: (qmail 1797582 invoked from network); 28 Jun 2025 12:12:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 12:12:36 +0200
X-UD-Smtp-Session: l3s3148p1@LF2cCJ84fjZtKPFJ
Date: Sat, 28 Jun 2025 12:12:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2 1/3] i3c: master: replace ENOTSUPP with
 SUSV4-compliant EOPNOTSUPP
Message-ID: <aF_AE7H6H_Zb2W0L@shikoro>
References: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
 <20250627111755.16535-6-wsa+renesas@sang-engineering.com>
 <aF8DLbPnxLJVDn6t@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aF8DLbPnxLJVDn6t@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_031240_976938_FB8747C8 
X-CRM114-Status: UNSURE (   6.70  )
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

On Fri, Jun 27, 2025 at 04:46:37PM -0400, Frank Li wrote:
> On Fri, Jun 27, 2025 at 01:17:56PM +0200, Wolfram Sang wrote:
> > The checkpatch warning '"ENOTSUPP is not a SUSV4 error code, prefer
> > EOPNOTSUPP"' is correct. We never want this to slip to userspace.
> 
> what's means "We never want this to slip to userspace."?
> 
> especial what's 'this' here?

ENOTSUPP. If we were 100% sure to only use it it kernel space, we could
keep using it. But since this is fragile because we never know about how
error propagation will evolve, we chose to not use it.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
