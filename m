Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28E7E937E3
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Apr 2026 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvJbKUSemQFK6nIdqpJQ2viFeqMCheW6nvCi2cDD0g4=; b=ZELQxq5hsKXd2p
	DvauhGHBpVRnF1HnubwbrNca/zLMrSrqCrjsSWaEYxGDd70DB3SxSEP8O3AyEH/OnUsEdOB+OIDoi
	lIfjiW+awdeqnIJUaPE4im+/x0L82XFCfeG/B31hdLLT8dV1GGwrPWrws+p7LstcOgxru3g/MMIqV
	OW/zZe0zwVr8lxM5ZTGS6YoulHwDwzLPcU6JvgDMiEy39xtG2Y71C30P6BnLhPhbQBrROPLlzzr8D
	q9nXeHs4zyg3F/FTgxOvmi6Qr9ndqvLGTrtbkn20OdA57T0eTHcST/BY3UfwVnUTp7HiH0q3X+96/
	pnhNZGr7gsIKtV+LU0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBwBO-0000000EPLN-2yH8;
	Sun, 12 Apr 2026 14:53:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBwBK-0000000EPKr-2HPb
	for linux-i3c@lists.infradead.org;
	Sun, 12 Apr 2026 14:53:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1DD23C5B186;
	Sun, 12 Apr 2026 14:53:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD8025FFB9;
	Sun, 12 Apr 2026 14:52:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45FF910451B8E;
	Sun, 12 Apr 2026 16:52:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776005579; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=/Gz7SjfuLeqZC/8APbVminmYMdlFMjnULXnp49xWcGM=;
	b=S8r/vk/BhJINByRb3/eSVx/9LVZ5r9VNozzvhz1IvbVvK3ne4XnljCp0DdNIW8ldTyaWeU
	pK2WilXPOaWSvdmtuyyBdVQBkAMGk3tz2bPYEr7Ym4Y7IJlGJJI4XIHRN6hLFXAaLWlFJc
	kv+xx/U60G+inWKJmNeZbULkXGs6viQm9EfMfaeOnjNwpYo/G5XJXnBVnYAZSGhMgSeS0s
	fGSYjeXtwaI18aKogXc7NHffcVUB4FqF9lGw/JLF1XTi/nZqUI6Y12v5k++qoeTFAjIzVv
	nwRF0YUhgJIOxiXkQG4GqrbsqmpylY/GUKUT+AwsIPtuoyi4p3NhzkEOZpt7zQ==
Date: Sun, 12 Apr 2026 16:52:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Aniket <aniketmaurya@google.com>,
	Felix Gu <ustc.gu@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] i3c: dw: Fix memory leak in
 dw_i3c_master_i3c_xfers()
Message-ID: <177600556369.2788428.11217704175888161310.b4-ty@b4>
References: <20260404-dw-i3c-2-v3-0-8f7d146549c1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260404-dw-i3c-2-v3-0-8f7d146549c1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_075302_747571_37377976 
X-CRM114-Status: UNSURE (   4.09  )
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

On Sat, 04 Apr 2026 18:32:29 +0800, Felix Gu wrote:
> 


Applied, thanks!

[1/2] i3c: dw: Fix memory leak in dw_i3c_master_i3c_xfers()
      https://git.kernel.org/i3c/c/256cc1f1305a
[2/2] i3c: dw: Simplify xfer cleanup with __free(kfree)
      https://git.kernel.org/i3c/c/6105f4919615

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
