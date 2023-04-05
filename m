Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7AEC7618D
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Apr 2023 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZAcL91YRs+7wdYRCIHtAXsSSQbhKv8u+9uW9SnrNk8=; b=inQLXM+Pf0ArFC
	Z9Nf/pfCH7r6yBC+0Cf5lwxIIzbG/VMuUvIenKIBTbwEWiAt88MqLbjGG4utZuWG3o/26wDZKJ3yF
	4JiW0eMUAwOG2PAAuUGuGsFVW1FB1jMImGBUNSNCCPkKjDfd6bKzaSY+0wMM32FNFeH+zJkT/aXxC
	Vj5Bpevgdt0hac+ZfD0kf76c99phiVIhLsF4H3ld8t4PMLXMc2rbd9o+1pLZ5sKd/Q+2KOUjJfXDV
	0RiPAgWgfvBEDoiw0CAOcaBqr0BHp+omoEEoPtZ2StrSOA+8xHPbPbOb324qJHSs+dfwl/9JzPvRj
	f6da3Y6Ejcm7q50glO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMc8-006yfW-1D;
	Thu, 06 Apr 2023 10:13:08 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjsK7-0038Dc-0q
	for linux-i3c@lists.infradead.org;
	Wed, 05 Apr 2023 01:52:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id ew6so137289063edb.7
        for <linux-i3c@lists.infradead.org>; Tue, 04 Apr 2023 18:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1680659547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d4lO58vBzScCago2059HBRosOdt96vH3MDCMxFhDpLU=;
        b=HwSCCqXDMy0m5qpeuL3nho2ae7NGTVlp+favKncFsOEx+buTc7X76zde/6X9FZfRII
         dV/YFIHSGCBcdRTGl7XqPcAMmnbUas1kvc1hTPh67y9MHgcsTzgv8vup8iENJWoXfOzM
         NaKoLk9WvGGmezSnFQSkQKVME+kd61lNwBa7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680659547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4lO58vBzScCago2059HBRosOdt96vH3MDCMxFhDpLU=;
        b=Ua9U9LzyAYGwHyuR8Vaq0SMVmbfMa9Fi9BnCXptJz018sCHyJLwYzI/Q1ngcrxhx+i
         yrToIqzTGLdKHZlB/E1V8Mu+LIHNQEzfg3r/+/Ht37NDDjF3zt0gZudR0sJOF/NnLAeA
         WWaeN3rat5v7qYb4/HFLpt6gCe/29TF0CUP4FF7P/RwYxd2amVu5Ojmkj8xeDaimzcDW
         yi6AfocoW6Mu/yStQwFUmF2XhZyEMHCwu+nnb8WxKgs2ps/DhbrZk33wi/e+v25cEXEM
         fXgsJVKFtbbv26M+Zy6KkAZ5T1ngmzaof5AAFpb/b7nzT4FDsqmRQ9VoZQgeLNtdi6vH
         4WrA==
X-Gm-Message-State: AAQBX9ccEphhXeGo5gcnYWP/X/gj+IzXZ4vdOY5EtMlsqoDh+fsoUrmg
	g/APGGemeXTDFGgqc4h93u39Wzwiwun5S47xjK4=
X-Google-Smtp-Source: AKy350Z4GY34/FyJIoHiTzDXPRoet2XYtZIsGqixctsIhgTdsjsUlDCm0ENZtjAH2qUyMbTU2uFhN6f3zFswoiR0zKo=
X-Received: by 2002:a17:906:e41:b0:933:1967:a984 with SMTP id
 q1-20020a1709060e4100b009331967a984mr726139eji.15.1680659547205; Tue, 04 Apr
 2023 18:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
In-Reply-To: <20230331091501.3800299-1-jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Apr 2023 01:52:15 +0000
Message-ID: <CACPK8XdLpg2H4a2nHo4PokfBc4r3D8MbK2-62jXkPXAq8Q03Rg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230404_185231_303193_919AFE30 
X-CRM114-Status: GOOD (  25.84  )
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

On Fri, 31 Mar 2023 at 09:15, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> This series adds a new i3c controller driver, for the ASPEED AST2600 i3c
> SoC peripheral. This device is very similar to the dw i3c controller, so
> we implement this by adding a little platform abstraction to the dw
> driver, and then a platform implementation for ast2600.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I have also tested it in qemu.

>
> For those testing at home: there's a couple of prereqs for getting this
> running: we need the ast2600 i3c clocks in their proper configuration,
> as implemented in:
>
>   https://lore.kernel.org/all/20230302005834.13171-1-jk@codeconstruct.com.au/
>
> - this series has been merged to clk-next, but has not hit Linus'
> upstream yet. The series will still build fine without this.
>
> You'll also want the dts definitions for the i3c controller and
> pincontrol setup on the ast2600 platform. I have changes for those in my
> dev/i3c branch:
>
>   https://github.com/CodeConstruct/linux/commits/dev/i3c
>
> - and will send those once we have the driver accepted.

Given we have acks on the bindings, I think it's safe to send the
device tree changes now so we can merge what you have in the upcoming
merge window. If there's changes we can modify or revert.

Cheers,

Joel

>
> v3: expand the prereqs & background above, and implement some feedback
> from review. Mainly: rather that using a platform_data pointer, assume
> platforms will use an encapsulating struct for their platform-specific
> data
>
> v2: This is a rework from an earlier series that implemented this as
> part of the dw driver; I have adopted Ben Dooks' suggestion to split
> into a new driver + exported hooks from the dw base.
>
> As always: comments, queries etc. are most welcome.
>
> Cheers,
>
>
> Jeremy
>
> Jeremy Kerr (3):
>   i3c: dw: Add infrastructure for platform-specific implementations
>   dt-bindings: i3c: Add AST2600 i3c controller
>   i3c: ast2600: Add AST2600 platform-specific driver
>
>  .../bindings/i3c/aspeed,ast2600-i3c.yaml      |  72 ++++++++
>  MAINTAINERS                                   |   6 +
>  drivers/i3c/master/Kconfig                    |  14 ++
>  drivers/i3c/master/Makefile                   |   1 +
>  drivers/i3c/master/ast2600-i3c-master.c       | 168 ++++++++++++++++++
>  drivers/i3c/master/dw-i3c-master.c            |  76 ++++----
>  drivers/i3c/master/dw-i3c-master.h            |  54 ++++++
>  7 files changed, 358 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
>  create mode 100644 drivers/i3c/master/ast2600-i3c-master.c
>  create mode 100644 drivers/i3c/master/dw-i3c-master.h
>
> --
> 2.39.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
