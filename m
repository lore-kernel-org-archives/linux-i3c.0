Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3C2CAC598
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Sep 2025 13:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ht+ffLufPKjKnJik6b4rSHxxs6xKGUoz2ddSFyFvRyA=; b=UzMwZR93kvBQ5x
	pm9uP0dXags3D8diJfxsL7E8zX2tW2yqryzbkMYAm20/tfn2hoTsCywool1h9W601qDGjLjh8naPS
	LTY+16c49YngPqVrCWeHuS/z3NfRn+ckz2bdCjplunBHah4UwX+rVHHAQNhv2o+BEC+gr54GxJsFa
	ax3K7jV5kfX529GNQfr1Qi902zp9XUojO6VII9GUe96bGKmV+a397gyr4G2H8Z/JMraAMRddh2JjZ
	yOcHCr85pRg/e6Rkr2rGxCjfXuKCncx4tyg50b5tRQu/NgAdPL/L90dJZMbWEqgpMpeao8eoRwaJV
	Vv9glLvo+2Jr6O9SWhPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVJr-00000007r74-0kXZ;
	Tue, 16 Sep 2025 13:02:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVJn-00000007r6E-2bHE
	for linux-i3c@lists.infradead.org;
	Tue, 16 Sep 2025 13:02:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D6A54C8F46E;
	Tue, 16 Sep 2025 13:01:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43A5E6061E;
	Tue, 16 Sep 2025 13:01:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F99A102F16E7;
	Tue, 16 Sep 2025 15:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758027714; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=k9M61n3kgzP2GV1QhxaccbFiJSqMOAJaomD40tqnjhY=;
	b=qYNe58LIJbjugz0DRC9rB3+gaAO55rAlDyzyo/ScR5dC3Ce0Edm5vWdbLQckVZCwNgGUOO
	ABqJao4X4oksQm/R27ggwiEEKngnyu424VWl88MTDHH8FDqb7k+b4rE92M/QPed8J2Vcko
	lk5jW0Xh+KBESeIX6GfRzS8sibHlWrn3v44NMaAQigEUoXM3l1tjABqTFGATYSMuj6KgtR
	rZM1pixQWIpEnRAZLkXPs0dAV0GTOHTn5Skt62umrXOmnEFUi1Ym7aKwjkC9Dr+XIgweom
	EnY1LEmAZvuoySyzidhW1pEtoKkdbAR2B+H2JKd0u34EiQh7oNER0ehfF/HpvA==
Date: Tue, 16 Sep 2025 15:01:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jorge Marques <gastmaier@gmail.com>
Cc: Jorge Marques <jorge.marques@analog.com>, Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: adi: fix header location
Message-ID: <20250916130150ed797d53@mail.local>
References: <20250916091252.39265-1-alexandre.belloni@bootlin.com>
 <jmfzuymhxvxnjwk73nmsfaaadnmy5uy4uanh4jegwgdvgfr22e@2iqtifbsgxmu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <jmfzuymhxvxnjwk73nmsfaaadnmy5uy4uanh4jegwgdvgfr22e@2iqtifbsgxmu>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_060200_353060_8CE926FB 
X-CRM114-Status: GOOD (  16.48  )
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

On 16/09/2025 12:45:57+0200, Jorge Marques wrote:
> On Tue, Sep 16, 2025 at 11:12:51AM +0200, alexandre.belloni@bootlin.com wrote:
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > The adi-axi-common header has been moved to the upper directory.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Acked-by: Jorge Marques <jorge.marques@analog.com>
> 
>   Commit: 2ad26b7bedcd4941e6dafa1851e2054b369b9d25
>   Link: https://lore.kernel.org/r/20250519-dev-axi-clkgen-limits-v6-3-bc4b3b61d1d4@analog.com
> 

Yeah, I'm a bit wary of adding the commit id here as there is no
guarantee the branch is not going to be rebased before the pull request
is sent to Linus.

> > ---
> >  drivers/i3c/master/adi-i3c-master.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> > index 162f9eed39aa..18597ba1f1c3 100644
> > --- a/drivers/i3c/master/adi-i3c-master.c
> > +++ b/drivers/i3c/master/adi-i3c-master.c
> > @@ -10,7 +10,7 @@
> >  #include <linux/clk.h>
> >  #include <linux/err.h>
> >  #include <linux/errno.h>
> > -#include <linux/fpga/adi-axi-common.h>
> > +#include <linux/adi-axi-common.h>
> >  #include <linux/i3c/master.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> > -- 
> > 2.51.0
> > 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
