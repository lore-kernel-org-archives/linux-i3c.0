Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01DCC433EF
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jun 2022 20:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gq1wFBzU5A0tZBET0zmnnOhx+NV2RKGCqVWE0KenjSs=; b=PhpljaZzJG1o8f
	YcuyMgxBL03BeIKDeI02MRtySVDaa98srvYoQ5JVC3IPYtqKI3eg6x4dDagwO5DHoEgYj3pemcGg1
	QlhFr9EM4pFl5hZCtKrUjxcWPcv3+b2cIcoTV8zxaSll31Toj2rZfGAY7BkEApCT6iwjSaNSAvX8Y
	tTnL/J780X+0KB8NTGKKBzqg3nIUNbWaeRrZ7FGy0vJlR/1dv7rnSB0lBGen34kFmVNG6IPOmmhT/
	Xg6WHRivAfQTijEJU4N0Z0dUtMDFUJT6f3sWUe3jafxshU/5uO9fSBpMezA/O4X9Fk0VEjnQU+Lc4
	FnVKNIU1Zfiu8DEn+ESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVH7-000N7b-Sz; Wed, 01 Jun 2022 20:49:05 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVH4-000N6o-AR
	for linux-i3c@lists.infradead.org; Wed, 01 Jun 2022 20:49:04 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CBF68240006;
	Wed,  1 Jun 2022 20:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654116534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=itBnDuOydygpxjCTl5U2crygqhbKNBZcw4zJX+3JOeM=;
	b=TsBwKSbimpLK5rCjTlX94Fw0+B3J8r1te1bYddmkru5waQjZuzQkvfU3aQy2s+Ko/tLB2W
	zzqBkehSz8OFphOsaQKIGdZUk+n35R9AiF0oU70VKsVPO+YJAF9hrmCVAaKqf0k7nNDdhN
	iAOBI7vUcojEU0+wRg6TDr+UCd8G6krYLF4Q+tZ7SWdKbIKPXe5QThybzznRakuphWmnUA
	t9Z1kdcK990L8irO6INMsnbtsnUAhRIQRH6OOyap/E42KyTZkmvIlnnHL+3o1QVVd7sahi
	lTiZflofjKc0KiT3GmhNLnzkldt28HlbWbXBEt0ouK4V47kiqURU7KEGycvFQw==
Date: Wed, 1 Jun 2022 22:48:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: rectify entries for some i3c drivers after
 dt conversion
Message-ID: <165411647849.792060.10768725309583825997.b4-ty@bootlin.com>
References: <20220601074212.19984-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220601074212.19984-1-lukas.bulwahn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_134902_868856_AA4F817D 
X-CRM114-Status: UNSURE (   7.14  )
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

On Wed, 1 Jun 2022 09:42:12 +0200, Lukas Bulwahn wrote:
> Commit 4bd69ecfa672 ("dt-bindings: i3c: Convert cdns,i3c-master to DT
> schema") and commit 6742ca620bd9 ("dt-bindings: i3c: Convert
> snps,dw-i3c-master to DT schema") convert some i3c dt-bindings to yaml,
> but miss to adjust its reference in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about
> broken references.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: rectify entries for some i3c drivers after dt conversion
      commit: 66ed42caf286a7aaeb6f1db4b2995dd9416226c2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
