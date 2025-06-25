Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBB1C7115C
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgzAyWEtLK6jYhiwIQx9MY6+9ESFr9quhuaES9csgm0=; b=UrcJXPKV9C6Qmr
	sHxMLdx3qWQIr09eUXSK7EfyfOCLTpUYbIm6oLrCIVka7HNgBHKChFa9vuXD/kzd7/NAiSqR92/su
	eRAqUlQjBHW6hf2uLkso/x+UYbK1vA8EUDNTei/eGok4gMHlQ1ofBCb8ZS4Omr+RQ09ceg9H8vBNL
	FloNDYbcHTzdpdP2sZ1Lj3zGttluoKWyF1k29t4bqlFDELTmY09izi/StddMES9JR/BtwCutHdOpp
	QuyzlrR0rOs8T0ufulZevC7DhGg7gihWYYCE3Q1qJUciCenvgcNqH0j+FRnTYmRiXCMR92Z8OnYgl
	VfilW7mAm2pQXD8leCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUL2y-00000007tIm-3yLo;
	Wed, 25 Jun 2025 07:59:56 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKXf-00000007obh-1sat
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 07:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CTJ7
	m01QlF0COGdgm0pbIkw/ui2APLrwIzfMjYyoeZU=; b=bRAqsqkb/n1EJw8V39JM
	y4BM8n/PZ/CWzXVJ0sLa6VM1mOco8HInKGbvm3OnWBLiYJ2yuE06xCpAsOVMVc0P
	vEBzs4VNzxojXLO3kwAGymyKXFUl6Fn8LKVfQ76+aaYignnBCIOJVkeB+QYJGLSk
	dCvlXMzhG8vQaouw7XAtmFaMd9CSQU/n3/GjoKVvBYCKhr6yDbQkunas/ImB/Bk9
	oALJBllPC4MXuUdFov7N1p3G4VyFH0SB1FblGTC/jdIlpeh9yVOMz6f7+eAQrTJ7
	gT1yv8anJmuNWzUK6Y0IuiBpBZKs5kfFdxghzYe7myGnTm2vafcl+6nQA6u9JJPd
	8A==
Received: (qmail 548001 invoked from network); 25 Jun 2025 09:27:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 09:27:33 +0200
X-UD-Smtp-Session: l3s3148p1@2abSYGA4UL1tKLNf
Date: Wed, 25 Jun 2025 09:27:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i3c: master: dw: Use i3c_writel_fifo() and
 i3c_readl_fifo()
Message-ID: <aFuk5IBH9N0ljNIK@shikoro>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-3-63ccf0870f01@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624-i3c-writesl-readsl-v3-3-63ccf0870f01@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_002735_758049_96C536AF 
X-CRM114-Status: UNSURE (   5.22  )
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


>  static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
>  				       u8 *bytes, int nbytes)
>  {
> -	return dw_i3c_master_read_fifo(master, RX_TX_DATA_PORT, bytes, nbytes);
> +	i3c_readl_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
>  }

Same question as patch 2, why not remove the surrounding functions?


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
