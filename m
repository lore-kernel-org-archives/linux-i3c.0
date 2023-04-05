Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6485EC77B6C
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Apr 2023 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpf1PcIqNx5ZAKn6CL9+Xx7t9XTWCe4ABTQyz45onRY=; b=Z6cXpmC/mI81jY
	GXh2w25tCm4ijzUelXhtbjYNG5+F6cSlBbKn3ww42vXB1edqLak/3vsTGoUCXqgl9I5ijvlfNHpsG
	k3zm23rmBi5QgJHJ+fn2quWiTsedrsi9B3Di3ItsuMyOkaStqp+JohY3qzVlF8yx2ZYqDoOtVKstu
	29ulOc5RkHg/KzLJZN1cb0qA82ct1F8+wPgk3MhIifPPYjVgpJ8/5qrkRRmMz+2pRymt5TQ4meWfF
	zk5jwomfJrEiQkSiL6L9gcCs+sNdIAoTtqXOwqMyHvwIzhN+9R2SLEq7gcZO2BkXXWcCQwwuqd9bQ
	UbpONODqEEJrbVRvT8/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMc8-006yfq-36;
	Thu, 06 Apr 2023 10:13:08 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjvC2-003LxD-2U
	for linux-i3c@lists.infradead.org;
	Wed, 05 Apr 2023 04:56:24 +0000
Received: by mail-ed1-x533.google.com with SMTP id y4so138132667edo.2
        for <linux-i3c@lists.infradead.org>; Tue, 04 Apr 2023 21:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1680670577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UaAvYvt5g6xXavruYf7/xZ5mYZyDGi7n10kqvlr/XQY=;
        b=YmBTz2LL6zsbKvAxNuWuYkm2ASVpLGWRU1Nykv1/CbBACrGHhN9MTCFv+srHqQ7I0C
         ZdgzuR68WHuMjZSZ+R0ieAYsCAQL2dX1Pc/NxK+PshHM9vcV957D/dTG61g1rdTeiqtF
         Aw0BGsOUmHdnPTrXepVUX2H3PbtHY8aLxPyj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680670577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaAvYvt5g6xXavruYf7/xZ5mYZyDGi7n10kqvlr/XQY=;
        b=rQ+komaryom6hJWWnTmvWH4ePnb/mI/ZOwHaWc7rGYPjwT2GlS32S+B38VNLOJO1T0
         ueHSvSanDTmrQoXyuXq8KRLrY4UgVbBwWBLYoRl1bgx469EEbzMKhv/XSFCwtvjPf9BQ
         i/udPIH1jqsS0xzJm6/YRAouRUYXFdpreMsxpVzHXIqiP2sJClKPJ4l159m3vBJZMiFG
         iS2rx/Nm9RUQzr7YUDPxVn5+Jj7VgB81lp7ezP9m2Jj3T5JDGk5HG3Qzsddz4JCt0R1a
         SOm4eGT6/egPKKgJ8RSxIHiBTVsBnH+k3H8k4olMm8UXkJU252UvquObJQnCRlUCHHUX
         XnfA==
X-Gm-Message-State: AAQBX9eyG8eaT2AukUHib5JrCT6NEKnw0mqEo9IdjOdUFb7eKKhJe2Bj
	U1X6BvFE2/FDKA62SEXBMyplqFHPIqy67Z0bu3Y=
X-Google-Smtp-Source: AKy350ZlXT+2/CbTi+BHrk0i9bjldcN5n2yS+gUKQt96ZoJPbwZHOUmmTolZYRVNrh/eU4b7rNycV+/k2lCYj/TW8DU=
X-Received: by 2002:a17:906:e41:b0:933:1967:a984 with SMTP id
 q1-20020a1709060e4100b009331967a984mr891245eji.15.1680670577207; Tue, 04 Apr
 2023 21:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
 <CACPK8XdLpg2H4a2nHo4PokfBc4r3D8MbK2-62jXkPXAq8Q03Rg@mail.gmail.com> <94e941a2895bbb40d7b87acd7de6525b8596b096.camel@codeconstruct.com.au>
In-Reply-To: <94e941a2895bbb40d7b87acd7de6525b8596b096.camel@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Apr 2023 04:56:05 +0000
Message-ID: <CACPK8XcPBCppbF8smOsO3csiWoomgheLHcudyNON3QDrwyguOw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c controller
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, Matt Johnston <matt@codeconstruct.com.au>, 
	Vitor Soares <ivitro@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jack Chen <zenghuchen@google.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Dylan Hung <dylan_hung@aspeedtech.com>, 
	Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_215622_893889_5FEF4A86 
X-CRM114-Status: GOOD (  15.71  )
X-Mailman-Approved-At: Thu, 06 Apr 2023 03:13:07 -0700
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

On Wed, 5 Apr 2023 at 04:34, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Joel,
>
> > Given we have acks on the bindings, I think it's safe to send the
> > device tree changes now so we can merge what you have in the upcoming
> > merge window. If there's changes we can modify or revert.
>
> OK, I'll get those into shape.
>
> There is one dependency on this though, and unfortunately it requires
> solving *two* of the known-hard problems in computer science:
>
> Do we start at i3c0 or i3c1?

I'd vote for i3c0, like we do for ethernet, i2c, spi, etc.

It is annoying that aspeed chooses to start counting at 1, but at
least we would be consistent with other parts of the kernel.

Starting at 1 reminds me of doing matlab assignments at uni, so that's
another reason to avoid it.

>
> [i3c1 would match the schematic...]
>
> Cheers,
>
>
> Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
