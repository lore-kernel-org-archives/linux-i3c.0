Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153ECC3600C
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Apr 2025 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Qnh+XWfC3xKCYIUXjTY1T3IaFJTLNwZ3YRZrIGyHC2w=; b=lWFJwWbY9imp963kY7UGMLC2vh
	4bqmIJ6bJSqd973bXFrlGbMccaiDI2rf/9HgjHDeIJQIghiI/7l+89q8OZSTYThcHtshY58wTdXMi
	v6bqWWsl0AcJVU8N92cNUkJjBQ40wYqeukKP+HYyn4gPwCk7ZvbIRXK7j2ifx+WfZf2/CarfoOeUl
	YGifznEXsazatDiCMBrstIIqv90hUwj7XFxKhfe920UXXBbIo01zrlqzFeNUCzi2oo4J20yxiBKds
	gJiIh/sxe3+wkvf+eDl1OMw4HQw4NQfL67l/AFwwChQUY5I5ArpYet/kLyyduxow9j5aCkpCARl3t
	SmHfNSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MYV-00000009EwB-3Tyv;
	Thu, 03 Apr 2025 15:32:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MVU-00000009EYJ-0uMP
	for linux-i3c@lists.infradead.org;
	Thu, 03 Apr 2025 15:29:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9737CA42E63;
	Thu,  3 Apr 2025 15:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0976C4CEE3;
	Thu,  3 Apr 2025 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743694167;
	bh=Bgq41wO06U/uAv1x2bdgMUv74XXWVKv/4GQnQMRuXSM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=i7Zra+8KODyTzoQfJUyH1kWy2yTZ61f20dK6Eqb25GYQq6h9Ak9jIQWMdpwHcThU3
	 Zln7ZWPtrsEna2ZvwDnef6Yqu5aon7pxRrgqBFOuKl/r684TyR+vU9vNnKbz91ygVS
	 xjoQT5wApv/lTcO+3JvK14/e3RrrPEvPl9iXfp5wFvovlnYwu26GV0/CUUgfs85llO
	 Nba2d61UvNrBo/5ZZMFE+R/97zZVg01lNcYbxkY5iEpFM9FpuqeL6yxs4Sh1XWYQDp
	 8iCE7WWlgEUvh0U5MBV2SzBNZOt6axEUlyky77eKmeZ0Rw/EUdtnyCWpLZkd8M+ktn
	 Zc9LSEPl557Gg==
Date: Thu, 03 Apr 2025 10:29:25 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: konradybcio@kernel.org, jarkko.nikula@linux.intel.com, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, andersson@kernel.org, conor+dt@kernel.org, 
 linux-i3c@lists.infradead.org, krzk+dt@kernel.org, 
 alexandre.belloni@bootlin.com
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
Message-Id: <174369416594.2973751.10281214414907199841.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_082928_335828_C9FC327F 
X-CRM114-Status: GOOD (  10.61  )
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


On Thu, 03 Apr 2025 19:16:42 +0530, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm I3C controller. This includes
> the necessary documentation and properties required to describe the
> hardware in the device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  .../bindings/i3c/qcom,geni-i3c.yaml           | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml: properties:compatible: ['qcom,geni-i3c'] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml: properties:compatible: ['qcom,geni-i3c'] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Documentation/devicetree/bindings/i3c/qcom,geni-i3c.example.dtb: /example-0/i3c@884000: failed to match any schema with compatible: ['qcom,geni-i3c']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250403134644.3935983-2-quic_msavaliy@quicinc.com

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
