Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628FEC3ABC0
	for <linux-i3c@archiver.kernel.org>; Thu,  8 May 2025 06:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xcXlv+qAEvMOW/4lNWcYpRLhQ5b3sQMQzsOkSopD1oQ=; b=df8KLo7Clu7K1iY4hGfjMi1Q2V
	b2bsR7bDu5lEriOUuMKnPtWLtXMipG/DC2tZbOYhPo+I5Koq1A2s+Z+LZzcetYG5+Ypln/KsNPjMJ
	0ToKaO1TJY+v5xmtDFxaVecXAdX7IRW6/pFiEMZ0kwfazC6mYLeMKmGgqyiTm5yIxSpDJmXawLe0Y
	FPUesmBb+mpwhTCj/AIXBzGVJwEFV65mPUs2xoUQcWpj21Hm1JkH+OBmjGtFYthYkeyBUr8Lt3Rzg
	GDhUy0OHqqkxfEJhsZy26KUgv6EP9zksWw7ZTmeLztKi8GVFMlLPygyhOKrR8wzsiQByOnCRrtIAM
	xG/4km9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuRj-0000000HQyh-0iNb;
	Thu, 08 May 2025 06:09:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuRg-0000000HQxp-2SQs
	for linux-i3c@lists.infradead.org;
	Thu, 08 May 2025 06:09:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2634649C8E;
	Thu,  8 May 2025 06:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD110C4CEEE;
	Thu,  8 May 2025 06:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746684564;
	bh=vdzcGzInBDOdEhA5i4T5CvvF61LwUqRe54QNxKAiupk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ClkpjYlHj7FHHOznnrYJskuMCST6rbF/Mkh+sz+Uvgf9Y+9loiz8tIAIk5WeO5p0e
	 cLpuqEv7JThCGIroNadUvgMGs2MA8uu9YuH1XYB2qmoAu3UuqmxB/h+EDXLXZFuXhJ
	 f+YeJ/eijymplOtximmC72sHlYn1B+c20KeTSDd41MNeZkkjg5yi5+JSPrU4rxdFsA
	 Rdvknzsq4j8ef2HTQ2EDvbMjEwlmiKIlu54O/+p6OX/f2BVchIIHiWR9lO34PqV1eG
	 rkhUHL2s7aftRa6lgFElmGHZHseZWB7O0B9i1U9EQqlMYVUQAUMBcf+A6PwRKLc5n2
	 Qz68QUm3zCeSg==
Date: Thu, 08 May 2025 01:09:21 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
 conor+dt@kernel.org, vikash.bansal@nxp.com, shashank.rebbapragada@nxp.com, 
 krzk+dt@kernel.org, Frank.Li@nxp.com, linux-i3c@lists.infradead.org, 
 devicetree@vger.kernel.org, priyanka.jain@nxp.com
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
In-Reply-To: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
Message-Id: <174668456098.3462718.13659996753700192660.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_230924_642737_54412796 
X-CRM114-Status: GOOD (  10.52  )
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


On Thu, 08 May 2025 07:57:10 +0300, Aman Kumar Pandey wrote:
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> ---
> V1 -> V2: Cleaned up coding style and addressed review comments
> ---
>  .../bindings/i3c/p3h2840-i3c-hub.yaml         | 332 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  2 files changed, 340 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/p3h2840-i3c-hub.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml
MAINTAINERS: Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250508045711.2810207-1-aman.kumarpandey@nxp.com

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
