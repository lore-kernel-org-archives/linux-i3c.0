Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0843CC636D4
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Feb 2023 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqwYA51frYC/wDApGtAD+bxyqabocQDAknya3bnCpEg=; b=HLUp8l7wu/xQMT
	jY9gwxIvU7aSJ1/WgTVtwO8zCrULXb8yQ4YxnhoOqVslZpftO5HN5nZ88jaJ6UR4G52Nqs9Z1HlZc
	l4ismlqDiARfTnpvtOsZAWPL58bOInH1aaZVIcrmJg4RZgvylGFRzBe5VoGtoQdQXuOcV+830mf2M
	kgWwKR4C//brBYyUlEMJRMAvrhfwPeHPFFwAtvpsack+/seyL96TTWJonLM9u66aHw2igyc8aZHUA
	Q7z8hNGJCPdGAE67taHvXCoYyzSqaWnNgiocN9eau1ymo29TPp4/GVBLdVvqD79aT8uW4OvxlbP4C
	Wv9iCgiVZ1o+ZjHs3vgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaT6-00F8Rh-Rp; Mon, 13 Feb 2023 15:10:12 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaSr-00F8JB-Jr
	for linux-i3c@lists.infradead.org; Mon, 13 Feb 2023 15:10:02 +0000
Received: by mail-il1-f177.google.com with SMTP id w13so5306568ilv.3
        for <linux-i3c@lists.infradead.org>; Mon, 13 Feb 2023 07:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LTZfJmfMcujhNKLGLoEwVmdMPFYjexvLBhWg/YGsbfM=;
        b=eoVRdXuhOKNT6ndg3pYMZaTQ0v3gJyXk0u1n9C/QqWJkwT8jrP7jtJ8vHiQGebwofI
         juxprd1wez47fE1xb8iK2Ic8yKV+PfdzS8vAucX74VmOgKLkUGfJdS/wXYnWkgGJnxvY
         oZ6bH5kLa+o+fdx9r6trk5W4GujQUVLe4cE0bd0WRVpunQBshdtPyHwebEJG97W3eL+5
         hfHNBG4zlWPFkxuSru0+7R8OEI8Ll6yy+AIXITF1P3JIIKV+MGoR+jX6FucUndpFHGXo
         6EHEW814RdoHhJn6HFp8FQOWgfjEv/oqOOT/SiZw+7ELsJ5/uEt9KN9UOXcV/FTPjuga
         vDig==
X-Gm-Message-State: AO0yUKX7eHMGCWdDi9PyQU3qH5UFAJ4GOwuIhzBxLitONbwp7uR9ohiq
	5+cyvu1mgOGCypYJ9LJ1mg==
X-Google-Smtp-Source: AK7set9GJakT0VAo6Ha4wp16ihDld2jGVNlZAeO8dCGg80o4dGpH05cwMWfC69+yzHtrLzrIGtdJQg==
X-Received: by 2002:a05:6e02:1b81:b0:315:2d37:993 with SMTP id h1-20020a056e021b8100b003152d370993mr9906162ili.3.1676300985739;
        Mon, 13 Feb 2023 07:09:45 -0800 (PST)
Received: from robh_at_kernel.org (c-73-14-99-67.hsd1.co.comcast.net. [73.14.99.67])
        by smtp.gmail.com with ESMTPSA id h26-20020a02c73a000000b00389d02a032dsm4014411jao.172.2023.02.13.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:09:45 -0800 (PST)
Received: (nullmailer pid 11615 invoked by uid 1000);
	Mon, 13 Feb 2023 15:09:41 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-aspeed@lists.ozlabs.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Dylan Hung <dylan_hung@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, linux-i3c@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
In-Reply-To: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
References: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
Message-Id: <167630051588.6318.13648503218765402981.robh@kernel.org>
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
Date: Mon, 13 Feb 2023 09:09:41 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_070958_291317_5462558F 
X-CRM114-Status: GOOD (  19.16  )
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


On Mon, 13 Feb 2023 15:41:52 +0800, Jeremy Kerr wrote:
> This change adds a devicetree binding for the ast2600 i3c controller
> hardware. This is heavily based on the designware i3c hardware, plus a
> reset facility and two platform-specific properties:
> 
>  - sda-pullup-ohms: to specify the value of the configurable pullup
>    resistors on the SDA line
> 
>  - global-regs: to reference the (ast2600-specific) i3c global register
>    block, and the device index to use within it.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
> RFC: the example in this depends on some not-yet-accepted patches for
> the clock and reset linkages:
> 
>   https://lore.kernel.org/linux-devicetree/cover.1676267865.git.jk@codeconstruct.com.au/T/
> 
> I'm also keen to get some review on the pullup configuration too.
> 
> ---
>  .../bindings/i3c/aspeed,ast2600-i3c.yaml      | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.example.dts:30.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
