Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42155C6FA9D
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Mar 2023 14:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9d6sdbfeaM4HJjByZZRezFkpyx2FfBLPxibqObkP/4=; b=cvrtZim+azLBSZ
	0LRdC3ThkA51svAji1knc5AagumEB0iHQS3vaPDlOwrK/nOJM9AjsM62npclvN4GdGzDkyGj4jCO4
	TZnP8+VCHNXFwhkFbv27J15QWJ/5gBs3lAfepgav24EcXfPhszYM2CaQrZ1RBMF7drCqWJcORC3va
	/a4Gc6dL3JquN6yVffk6IdfGC97gYC22OrbIYcs189UevGULmnXaVU+y5xgj2DCssiUGziLsY5b+I
	hJHYdpoF/aPQYB1Igy8vfroTI/39HNDsJ8EdlbjBnskxaiZ9re8udyQzZTPMKNBL7B93kNcL6v0cF
	OTwoFaGeGnJXm1xIW+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXNdp-00GTSz-70; Wed, 01 Mar 2023 14:41:13 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAtS-00EhiF-V6
	for linux-i3c@lists.infradead.org; Wed, 01 Mar 2023 01:04:32 +0000
Received: by mail-ed1-x52d.google.com with SMTP id da10so47672247edb.3
        for <linux-i3c@lists.infradead.org>; Tue, 28 Feb 2023 17:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d4OrUOl51NPQf5S1PMv0oO+zYb0X1S9MmPzIm8SUt+E=;
        b=LD/KmWHqfartLmkLJt7gHl5eGHb7wHaDCmWPOru/WQV/XzmSkvRwmwUpo/cdsuM/e4
         LuKGXKskm9LBLx6ShF8U3PXcAFDYfQlbfpEMeHd8fJRhz38h0/WAyi/270I9IAsY38je
         UD55B20H2G9dVQ2qBSR8dqeQsEEHYK0K8WfBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4OrUOl51NPQf5S1PMv0oO+zYb0X1S9MmPzIm8SUt+E=;
        b=uvD7k3qwqSwK1YuqXlN12xI1gLFiW1MCChs7dCVe3Dt9eyX9/hLrELl+r71nqvX5vL
         2SUTs8oSelyi92xlq8OH2idxphpuIZiThZMQR4lky0bmbKxgN/6BJrcpzgZoCzu3GW3B
         WUbKrLag2z4jlIpZpisc5nu7a/ZMTZA2QlH+xKHRJACi8aX8a7u7wABfe6mcmEaAZp9u
         0XMlWhpn0PXgm+7MJaEa6DnW4GOlcFMaAv5avuA6YWWEo94nV4Fpw/TaA0JlxJqXCi4J
         xIh9iE4QNVLXpS3URspirB17gHWehFiDMUJICrkwyUvdaiJpd15wA5RL1ZfyWGlT6zXl
         E3Jw==
X-Gm-Message-State: AO0yUKWp7QHcUob0vQurA8pnXBg4NlDsIc93Z+H/p/ucS6zIBHRk8sbI
	Kye/VjnrhJAaE/wYXi0IKv4FykWhsKTp3bmigJc=
X-Google-Smtp-Source: AK7set+fLFqpaxP5q+miLeUyFfMGmV4RfJfEWRXJHRxOJeZuwqCAnyyTGPu4fdOX8uAmhcaCsX/0mtIygdv83fTuqrQ=
X-Received: by 2002:a50:9f6a:0:b0:4ad:7439:cecb with SMTP id
 b97-20020a509f6a000000b004ad7439cecbmr2688575edf.7.1677632667191; Tue, 28 Feb
 2023 17:04:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1676532146.git.jk@codeconstruct.com.au>
In-Reply-To: <cover.1676532146.git.jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Mar 2023 01:04:15 +0000
Message-ID: <CACPK8Xd0k8EKR1v4NVmgb6yp3Zh5hUyVyoxsyk0NTx9MF80oYQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] i3c: Add support for ast2600 i3c controller
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Vitor Soares <ivitro@gmail.com>, 
	linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Dylan Hung <dylan_hung@aspeedtech.com>, 
	Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_170431_043284_E358B05F 
X-CRM114-Status: GOOD (  16.74  )
X-Mailman-Approved-At: Wed, 01 Mar 2023 06:41:11 -0800
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

On Thu, 16 Feb 2023 at 07:42, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> The AST2600 SoC hardware includes a set of i3c controllers, based on the
> designware i3c core, plus some global registers for SoC integration.
>
> This series adds support for these i3c controllers, through the existing
> dw i3c master controller driver, by adding a set of platform-specific
> hooks to handle the global register configuration. This also gives us a
> way to add any future hardware-specific behaviours.
>
> We also need a DT binding to describe the ast2600-specific hardware.
> Since this involves new (mandatory) properties, I have added this as a
> separate binding rather than add a new compat string to the dw binding.
>
> The dt-binding example depends on a prior submission to the dt binding
> headers:
>
>   https://lore.kernel.org/linux-devicetree/cover.1676294433.git.jk@codeconstruct.com.au/
>
> Full support for the global regmap will land with this queued mfd change:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=cf2271843de835839e91c5c036492a87085af756
>
> Of course, any queries/comments/etc are most welcome.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Cheers,
>
>
> Jeremy
>
> Jeremy Kerr (4):
>   dt-bindings: i3c: Add AST2600 i3c controller
>   i3c: dw: Add platform operations
>   i3c: dw: Add AST2600 platform ops
>   i3c: dw: Add compatible string for ASPEED AST2600 BMC platform
>
>  .../bindings/i3c/aspeed,ast2600-i3c.yaml      |  73 ++++++++
>  drivers/i3c/master/dw-i3c-master.c            | 165 +++++++++++++++++-
>  2 files changed, 232 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
>
> --
> 2.39.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
