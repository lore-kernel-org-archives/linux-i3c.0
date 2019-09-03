Return-Path: <SRS0=QM85=XF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD800C49ED9
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Sep 2019 06:39:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B520120872
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Sep 2019 06:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c5TyAaB2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B520120872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3oHM91nEas6KNnYU8mqPp9G3xKHL0Pjz8hUsOL2DC4c=; b=c5TyAaB2l97Npm
	CyP93hMTi7bHH/FqoZOXtH4oSndhQYyYRG+bqJ6uZnGFxbOxEdnjaYm3gKaijU7UjKjozknR/YT7H
	4nC1eJwWGhGZAwV1grNEsDU1gJ+IfeVKvrTI4w/c3LQk2CvisosZUPBUn2jWIqe27EteieyK+Y4YY
	ZXSdWSi4XY+CrOz8MekndYX+4QEnoUeos8fgtAGesVkFyuABhUf+ZY9kWntDYhcmLcKlS1KNu8Pmx
	sxEIH4f40VQFr7q9Tr80k6aBnr7wb4RfYvzFCpgqIS4DffEpgJDEDTHRaR/U7SLVe8rF7clOxhsUl
	HrzyCkP9AngzHCQEB37A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7Zof-0006tq-Cb; Tue, 10 Sep 2019 06:39:53 +0000
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5Cnu-0005hN-8p
 for linux-i3c@lists.infradead.org; Tue, 03 Sep 2019 17:41:19 +0000
Received: by mail-wr1-f67.google.com with SMTP id s18so18454840wrn.1
 for <linux-i3c@lists.infradead.org>; Tue, 03 Sep 2019 10:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ieQ0SS1TbyTo2Ti96I4YLp+pK1fJ3Fs4s6IUdQyKN2Y=;
 b=sUdvLr9vttvInO4lptl+SBLHmh/azr9r66dPPcsgqcKbjGqJ5qxbQzka/GjTwd2+Al
 fimvbo46vx59T9GKZqz79sqcfeySS8go3B8vr6qXWo5aDC7ZUlVHc1TuZfEnEYwJcuFc
 sM8HBKi2DTpQEg13FTxcSe+v1kgWYWjYhaLcchJp9Y65babKZG6z/n7/8QMwUNddMNdf
 h/Ex6c/VREjqWnEP0st4FC0CO7ispQ0ktGCkS3Cs2nXN6KQQ5SDQFvpirIL1dFh7g/Zr
 JZPKbC7F+NHIRWLzmcaJ71lA3yR8qOwEuYW0NjfxWPpKboOeqY3fRiaSXGFe7/p4nX8O
 LR6w==
X-Gm-Message-State: APjAAAUvMqKaVMfRsMCOCja1ALa3vZAD88N9JjpeEIEaeLWr4ZDX7NSC
 XM9Ad8J4+oiV+X2fRIAUkA==
X-Google-Smtp-Source: APXvYqxnUok+psv1QFkj8jaGGJBG3k+UUbHqh55UDvJs1Lvg9ReVnSTkNKcfQo3GWrM2PteMUQAa+Q==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr28322655wrp.122.1567532476537; 
 Tue, 03 Sep 2019 10:41:16 -0700 (PDT)
Received: from localhost ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id b184sm294493wmg.47.2019.09.03.10.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 10:41:16 -0700 (PDT)
Date: Tue, 3 Sep 2019 18:41:14 +0100
From: Rob Herring <robh@kernel.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: i3c: add a note for no guarantee of
 'assigned-address' use
Message-ID: <20190903174114.GA3710@bogus>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
 <159ae86a8f87b8d518bf63a8946b03b14e6b5500.1567437955.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159ae86a8f87b8d518bf63a8946b03b14e6b5500.1567437955.git.vitor.soares@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_104118_315927_8CBE73B2 
X-CRM114-Status: GOOD (  10.76  )
X-Mailman-Approved-At: Mon, 09 Sep 2019 23:39:51 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Joao.Pinto@synopsys.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, pgaj@cadence.com, robh+dt@kernel.org,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue,  3 Sep 2019 12:35:53 +0200, Vitor Soares wrote:
> By default, the framework will try to assign the 'assigned-address' to the
> device but if the address is already in use the device dynamic address
> will be different.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  Documentation/devicetree/bindings/i3c/i3c.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
