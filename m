Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9F0C77B7C
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sa56dHmW1tMagbjX3IjVbojtyIn6VyPw/DKQ89XUGOk=; b=Z5mGfxr/vEnefk
	I4hI2AWxvH04f24b4VpNcjdm3LyrTZeUR82MUWLlvYJHNrjOC4BtcEBJqARm1Z75EOQglmeiSmbSb
	heratkKByJn5F6LaDvXUlZsD2j1Tk47qAyrTEN618DbKSYaznqx1TadqJJ7CmGbwqLlmD6z35gUow
	+X3zWkwJvzCgTpNuv/Mg7O/ax48cuH3BEKu1vq5k6aN4kIBcmEIblznjBMFjMH6L1Aa9PP5/W0VVZ
	pWG788W4fIIt3AUIy2T9p/3OePDuKp1h0YUQCB4eObIPrjm3Rtxp6IIsdnqnlMU07uGLqkunruz7L
	hTYH2eniTs8qijH7hDXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUL0i-00000007sxH-1MxN;
	Wed, 25 Jun 2025 07:57:36 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKRF-00000007ncw-35Xq
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 07:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gjqM
	H2zNkL3dLw35KgCJ0ZyWLCd5EPM3hQGLl0YMnvE=; b=JaoWRkVrsF1lJfJk+V2F
	daVzqOQXy97TpNJQnAdvNr55sk9SBbUFxLAhVjVYLWB6STOBDGC126KQ+79p81nY
	TCIhUgBO6ZqkmAoeP8kGMTf1kMgaliJMLqaTTlLNTxuzi6jHaeF5WBa+1y7yjnXL
	RxWCwQ0GIwyvjq3vyOJOEcUdkKHYOjrpU2MGo1BgHr91x0dEq30JEb3X0OlY9el5
	1kHDtdpHsKBUU3LBs1yatO9GcSNkqG7t0RoSQzdWZlO+s/Ovw1o/7T5JlvbtS1K5
	gvGG7GQSTgfNmNoU+dkluV9ymeDNh5AgngdqARv+BeE+QbQGmuvCbycTk7oYfeKs
	5A==
Received: (qmail 546082 invoked from network); 25 Jun 2025 09:20:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 09:20:51 +0200
X-UD-Smtp-Session: l3s3148p1@fmzlSGA4lsttKLNf
Date: Wed, 25 Jun 2025 09:20:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFujUtrDB_XVr11n@shikoro>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
 <aFrpra9j69OkkMbL@lizhi-Precision-Tower-5810>
 <aFsK8sDj7WvIBZvW@shikoro>
 <aFsU3YjzjxzR2drQ@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aFsU3YjzjxzR2drQ@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_002058_661869_F2584474 
X-CRM114-Status: GOOD (  12.38  )
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


> > Is there a reason we don't put this in 'include/linux/i3c/master.h'?
> 
> master.h can be accessed in whole kernel tree. The scope is too big for these
> helper functions, which should only limited to i3c drivers.

Yet, who is going to include 'linux/i3c/master.h' outside of an I3C
controller driver?

> 
> > 'internals.h' is used for the core only so far, and '#include
> > <../something.h>' also looks a bit like a layering violation.
> 
> Not yet, you can look driver/pci/controller/*,  which include ../pci.h.

I never denied that it already exists in the kernel. But it still looks
fragile to me.

Whatever, it's not worth a big discussion. We can move this code if
there ever comes a reason to do so.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
