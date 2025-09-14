Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303BECAC587
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g01kdfHEOazXgRxalrYFfECtl3iwjLhgWEyelfzTmi8=; b=NV9dCc8huRqUgS
	RVQFN3CzmCXf7BOYrGtM5DgxQV2h9dyvCwbjzAGo7cd0SRXu1g4jzHtL2Qu9jnLoAL8m3IGtXN4VZ
	n5rIw3xD1o5yHoRRScO/bMnNUf9lbzAkaMEjmaN4zLmyPZs8luoIhEme9ovufSVn2LpNozp1q+9fa
	dk8e59PtpsJldTMlBdtz6Qfp72MuCkZd7PMwNICvk5k/C6bRzgcLXTQnUIMUkvya9cFHKN6TXRpUg
	k5mqe+MOiSHljF1Jf4sOnkMckm88umvSAmOdZA4klYidIkaQmPoQOTJFrpnEr+g2st+Lr+o5ZWEdt
	2Hn5QdJR8jfDheiiI/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtjp-00000002CRf-43P0;
	Sun, 14 Sep 2025 20:54:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtjn-00000002CPd-11D4
	for linux-i3c@lists.infradead.org;
	Sun, 14 Sep 2025 20:54:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BAD764E40BD1;
	Sun, 14 Sep 2025 20:54:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EAB86063F;
	Sun, 14 Sep 2025 20:54:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A654E102F2A7F;
	Sun, 14 Sep 2025 22:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757883257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ihIw/PXqVfsvt59L0VFImOtf51q1FRfV6w8XRlZ4Ft8=;
	b=xeGUVM+Sj+9Dgs8CiVWWe3q2s0jgqBLuGGBsyP3AyAo0ig4Ypp/oJ+UpbLgG8JqGP9+GgB
	j40GluxagZ+8EUod311DSMW2QXsbWOhTMJnDgwGythulFCYxB8ncCL1iRbFEIRCs3qWxFE
	Kfz0jcleSbOPMTGh8yYy0vPgpNaIjYvzP+IsqvtpC/5P8E+nax4rmuMzWSUvqyZw8rsmIf
	V8zEPzHJwS5yymnAXASoC9NFVyWe0vQhkWMCNcMbr7cihdieqWOpaTMGQQjO8pa6galEEL
	xSLOZOiQUqdz5Tv8dCGB4cd5oCvG25FJ7VIdQ6CMSvkexN5JEaHgI9L65IyGvg==
Date: Sun, 14 Sep 2025 22:54:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: renesas: Simplify return statement in
 'renesas_i3c_daa'
Message-ID: <175788312845.382502.12699337913885146267.b4-ty@bootlin.com>
References: <20250803211256.18513-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250803211256.18513-2-wsa+renesas@sang-engineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_135419_413750_3D7D306F 
X-CRM114-Status: UNSURE (   5.98  )
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

On Sun, 03 Aug 2025 23:12:57 +0200, Wolfram Sang wrote:
> There was already a bail out for 'ret < 0', so we can always return
> success at the end of the function.
> 
> 

Applied, thanks!

[1/1] i3c: renesas: Simplify return statement in 'renesas_i3c_daa'
      https://git.kernel.org/i3c/c/b22971d9629f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
