Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A849C83F1B
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Jul 2025 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQRsgnxrJ/bJRm4WK6lvqzcmSK3p61OqdbhY+SHyvNU=; b=10KpOEz+SLn5xF
	p6lLN1HpCpWNyPYHk3TBSLXjkF5ZK5vdHtaAKPa4s4Q7WlBlZbgqAOFEtSO7kDHmn8AP+335B0OSZ
	Cl9RX33xR1GlBHuGMtoBebDFZfVjmOFnM99MlPH3CSWi10IjZ2erEOR6tvHUwKonDpY/JANlpuJZT
	su30k2SZ5/8smJtwtW5kSUOYlWquQTdWrw3YlHnEN1yw5utuOt1DyI1H+0enQ+aH2pz0Au32jInFZ
	e7sV/BDYOjrWHZJ8rS8PjX13z/BxKNf8oEzzNThHI9biFQYaGW7+R5uaXk89ZqWdXAjdNhnKRLg8R
	hV74K0PiWrBRqEymyS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucORj-0000000AE7s-4Bdg;
	Thu, 17 Jul 2025 13:14:48 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNLt-0000000A41D-1en0
	for linux-i3c@lists.infradead.org;
	Thu, 17 Jul 2025 12:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HL0V
	WTAht8AVy4zqain08zkh4A2mMxT0R9SsJPX1Hl0=; b=MCzVgkqnJqo5893x/yj9
	FvBv65ra2ykSCN8eTFbvwwt2+himuFy4BGELoaE40P7c35EPyZfOOcVr092JM1DS
	htX97mIXCei0NertlUBEfObwcUqEOKd4QMAJTtmiExunsgz9SyV7gaWSHB3wIsRs
	INyTa1LyeVNzdgUkEfgufddWMJStpV7hINVz+bOUSVF5gqt/7ulHeyXfT65Oq8nt
	XgMoCEFsrFtyTgs+2QzqVdGRUhPNeuxZR37oa3LN0JP6pzfu5Fdg6PNC/z9FFS/y
	oyBIGq9o3xXqWSDIDciIS/XwEGCVfLJfCnp9ueVL3Z1F/MQJG92heFT2nKSWftT4
	bQ==
Received: (qmail 3665366 invoked from network); 17 Jul 2025 14:04:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jul 2025 14:04:39 +0200
X-UD-Smtp-Session: l3s3148p1@aSlU0B46UpMgAwDPXx+vAAkEB0lWxGP4
Date: Thu, 17 Jul 2025 14:04:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: add missing include to internal header
Message-ID: <aHjm1tjpBk4h3SSp@shikoro>
References: <20250717120046.9022-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250717120046.9022-2-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_050441_707932_7AA4AA90 
X-CRM114-Status: UNSURE (   8.54  )
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

On Thu, Jul 17, 2025 at 02:00:47PM +0200, Wolfram Sang wrote:
> LKP found a random config which failed to build because IO accessors
> were not defined:
> 
>    In file included from drivers/i3c/master.c:21:
>    drivers/i3c/internals.h: In function 'i3c_writel_fifo':
> >> drivers/i3c/internals.h:35:9: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]
> 
> Add the proper header to where the IO accessors are used.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507150208.BZDzzJ5E-lkp@intel.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixes: b7371ff9bdf7 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
