Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC4EC27C53
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Jun 2024 07:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gmt7QCFj6pkWRDaQOJmVYCGUf8mk8Lpfb6ZrqwROCSY=; b=MewtZA/jYZCc7g
	oFZw76VbcF+37pDRLTBtKeJN7ZlVixlohwcPIPx1BzTP0snxXmn0MEeFTR23qcsIOlDy3QS+4/NoL
	5cIvl/COpW0GZYly5336FP1RBSMDy+SuhrzcIQkxUJWq7wKkKaFjrXZKU/FBDr0PlCElgk8dookc3
	rgV9KopkuNV0mp1iluRN7aEYQAEi1YNy/WDBFL/Fg25aQOb9nkvrBOu5dlX4H4YKpS9kpI8O1ATqv
	OSzj4w1vgF/RDzTskagoBRF982dz5JXgqRo0+1RdtUngJNWbQPN1GGgLUDsG44vJGB20MjyNwwSbF
	lWu8Q7SiIbbw6aGa2o6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFU1R-0000000CuzA-0RhK;
	Fri, 07 Jun 2024 07:28:25 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFU1O-0000000CuxJ-0y7g
	for linux-i3c@lists.infradead.org;
	Fri, 07 Jun 2024 07:28:23 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 90A6620075;
	Fri,  7 Jun 2024 15:28:17 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717745299;
	bh=swrYQEjyK5kYwE+Ufbh6uLcnvJpDBZncNNf7rt1zomQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Zydq7R3Npt8pIWMv3xfBIn4ZsguMHAoWuT4jGKZtTpavz3y6niIC7xs6jgYar1yyH
	 WKX+dA8jDzgpHXeg1yFvqF1QOl1reUWcqObxToxTmcNx3ryUOHkVJOnTJJDN92nyfd
	 w+z9yo9C/U52GswCH9DQehGVHu53IXi+OoFrKDfmzP5E5/WuVXZsBeWGPK/1VVqJvD
	 OXJetvyWxy5FCnFF7VW/xb8tN7/ZeAtYEUA5LthppT7+0JfEda4zfx9QZtouYV/USL
	 ZRzmBiBJ2jRcLbfaKo1bDEaOF62/1E8ZaOTpXc5S6glFISUk3IBcill0fde4QOyP37
	 ywmV18aJ9Z/bw==
Message-ID: <c5199da0d4542c7ab8eec1c6d36fc329a937019a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] i3c: dw: Fix IBI intr programming
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Aniket <aniketmaurya@google.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, Billy Tsai
	 <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 07 Jun 2024 15:28:17 +0800
In-Reply-To: <20240607072030.2618428-1-aniketmaurya@google.com>
References: <CAMmmMt2guEx1jajb2NC0iBnMGpkd2vaSiXg_BqgZhwrA=FARLQ@mail.gmail.com>
	 <20240607072030.2618428-1-aniketmaurya@google.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_002822_493484_9A10578F 
X-CRM114-Status: UNSURE (   5.33  )
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

Hi Aniket,

> IBI_SIR_REQ_REJECT register is not present if the IP has
> IC_HAS_IBI_DATA = 1 set. So don't rely on doing read-
> modify-write op on this register.
> Instead maintain a variable to store the sir reject mask
> and use it to set IBI_SIR_REQ_REJECT.

Looks good, thanks!

Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
