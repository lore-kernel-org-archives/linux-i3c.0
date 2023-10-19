Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FB3CDB483
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Oct 2023 12:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4JbzQW+hArK9EOTmF+g+nWywe+3GElHez0+sK/ZjR8=; b=cxsNXEEnbQ74Vw
	Pm2lnttM5bd1Uo4iE6legMWNHATLuV1sF/qVilpB8fCh2tkLFySKsPY/RZOV6SC3EWAhfbegbi91o
	p50Qu5KGxL58Mn2KiQbsbi5eWwolgTcwCYjaaxuC/c4nSdX6meTXTGaEyc5OVPHueozymx/PZJMaG
	m59UxECb7bKbEotA1M4I8CS/yovaut4aPsAN9kk+IBawkfb96DinAn8X6BTiLAvcr5pWYW3g/CeD6
	2jPTqa0iuKQwfa6d6KpknSgkT2qahtIXbaeMZFq7biITDP2SkSHY85xqvza8+weTbyjZthicNE0DV
	Qrou2Exg5A8drhSD7X6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtRo7-00HHMS-2V;
	Thu, 19 Oct 2023 12:07:19 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtRo4-00HHK8-39
	for linux-i3c@lists.infradead.org;
	Thu, 19 Oct 2023 12:07:18 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6c4cbab83aaso5177274a34.1
        for <linux-i3c@lists.infradead.org>; Thu, 19 Oct 2023 05:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697717232; x=1698322032;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wFRRjT0zTXmC6p8qcDVTA0QbXQCr167IFLosJYeNDXo=;
        b=SRTzXE+IAga+aBw4KfFYLiQGe/Ox2FwdeZK9zbrR9oQ9stRHUrE05iSd5dPjPNFT2e
         Wua8xqGr1Mt1Nf9lpeSCnN2m/BjkimHrmjFICA25f5eC+8SuOn4KZfZybdsy79avPj8S
         oM9WgaOhs5se6ff7lQMHSy3zsK1q+GvWEAduWSoPNyIbwY3Y93J5uwR4dDPeiNOvkt8H
         Yyy+rMo3aZJSb2BMQIi2rl0sHocpUbQ4/w7Bel5mzy+4BVm7XM0RYvwT1PCIo2mlzvfB
         qpZoyhs86SGv7tEURNmy2FceQEBY3XYmTxvcX3ZlZ/6pdHd+oU4ky8V/jOaCbNakvm9j
         wX/A==
X-Gm-Message-State: AOJu0YzmJeIUoHu5lS1dViwipb3RZwGEzL0dH+G1z8r3eLTKiI+W8plQ
	IUF6gWE4E9tfpHEZXdrRlQ==
X-Google-Smtp-Source: AGHT+IEfITQC2V/bgA2b+RHY/6I/+aBRIkh/P1bJ3rw0OSLx58gTCW38pQSGxGPP+yMClqzepIgtvw==
X-Received: by 2002:a05:6830:2010:b0:6cd:bc23:4b55 with SMTP id e16-20020a056830201000b006cdbc234b55mr2070985otp.13.1697717231931;
        Thu, 19 Oct 2023 05:07:11 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m3-20020a4abc83000000b0057377b1c1c8sm994141oop.24.2023.10.19.05.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 05:07:11 -0700 (PDT)
Received: (nullmailer pid 549233 invoked by uid 1000);
	Thu, 19 Oct 2023 12:07:10 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-doc@vger.kernel.org, conor.culhane@silvaco.com, conor+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, imx@lists.linux.dev, linux-i3c@lists.infradead.org, jirislaby@kernel.org, krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, linux-serial@vger.kernel.org, robh+dt@kernel.org, corbet@lwn.net, joe@perches.com
In-Reply-To: <20231018215809.3477437-3-Frank.Li@nxp.com>
References: <20231018215809.3477437-1-Frank.Li@nxp.com>
 <20231018215809.3477437-3-Frank.Li@nxp.com>
Message-Id: <169771723040.549216.11346182362736118901.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-slave
Date: Thu, 19 Oct 2023 07:07:10 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_050717_009952_FD4F5255 
X-CRM114-Status: GOOD (  10.30  )
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


On Wed, 18 Oct 2023 17:58:06 -0400, Frank Li wrote:
> Add compatible string 'silvaco,i3c-slave' for slave mode.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/i3c/silvaco,i3c-master.yaml       | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml: properties:compatible:const: {'enum': ['silvaco,i3c-master-v1', 'silvaco,i3c-slave-v1']} is not of type 'integer', 'string'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml: properties:compatible:const: {'enum': ['silvaco,i3c-master-v1', 'silvaco,i3c-slave-v1']} is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.example.dtb: i3c-master@a0000000: compatible: {'enum': ['silvaco,i3c-master-v1', 'silvaco,i3c-slave-v1']} was expected
	from schema $id: http://devicetree.org/schemas/i3c/silvaco,i3c-master.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.example.dtb: i3c-master@a0000000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/i3c/silvaco,i3c-master.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231018215809.3477437-3-Frank.Li@nxp.com

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
