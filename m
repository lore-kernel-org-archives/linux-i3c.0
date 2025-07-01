Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF0AC8303E
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/xTuihWL0uCGAMzr/vcFjgSV2UHxx68wUweRYCCvBac=; b=ol6AKk+Op8TYreDcnf/xKeIojO
	zj2sVDXQswJKmLnp60+lMudCOIpFOdrzngg6ikHYK4G48FcKtbTnPNY8NS9J2MJX8F3r4rchWExUy
	p5KuFdGdtUo1YlmTTWbe7ogeI68+oVtQWAhKeRp3t0fsnpsFGTbm+5aUfGKKkP+yFaiNo3R/AuKc1
	lmDzlz3stA/k2TFA0v/xX+vghC5A/LvoVCGr6uhHLWoTOlOKLsNGoR5dOEPwJQmiwZxg3isEieCXT
	HUruO1y71GfHY7E2ehxVKuUVRaJfrATGrQiQXpUZqZ0UOggbR684ZM9Ah2exZr9eHyK6qgEFwjBFP
	DvyshW7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWjM-00000004U2z-1thU;
	Tue, 01 Jul 2025 08:52:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWNn-00000004Pwc-2sXe
	for linux-i3c@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=GuIw9UwRYqdc1QICFbW4RDlZYtqjgJMEIX37gFy60SM=; b=GtwzQw03HqxCd6iwnQcTZkQcIY
	ku2Q4CAzcIaFLc5OS+04hVQBUklYgUHEXKvmdqrzSfUiDyqOMzvld6Hz8DNSl+8cNt5ez/sX9BX6s
	J61VXDRZQauJjopFvcq3Y45R3FO/m0H3KDAKjWrpV668IrW34pVNs0XQVdh0o0szf/tzt4u7fIy+q
	zJkBdR2B0VFyjT2bbfypWVAI0hcf1wCVwskX9xg2T5waIssDLpEa3p9O24xudw8QoHSvpIfBXc3Eo
	wDuEUNU3l4B02L3rl7/2X32D376SU9rMP4Il/zcfoQlw91vDv0vONKiPNM7thRFRTlVL9/uwCgZBh
	s13g/E9g==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWNk-00000006yvp-26gi
	for linux-i3c@lists.infradead.org;
	Tue, 01 Jul 2025 08:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35A31A51C71;
	Tue,  1 Jul 2025 08:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1634C4CEEB;
	Tue,  1 Jul 2025 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751358620;
	bh=HL7i/yJKOopc3B9FVmXFkyNK1QnF2R8I8jERrgLs0HE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ceOjQ36nmlLXS9wFIcm3k8P6kEJXIAzbm2leVWHFdofZ4DNS36KU+C6C7NcHbc0d2
	 /TphWXbRS6EUwaBdKOoxqfElDyGmUv3yPAm0dzq4CaPlKQKF/iDzaTUQ4hTxrFlPAt
	 Iknv3zTGLZicbmDxCxQCzTJa9LRmkKyQQNsDrbf16RrOmuRV7G/e9xXOkFTDA6o9qs
	 BMy4uM1oRyczpRZ6rfQXU5YHfgjnoESkIeuG9+uvapfsx9UFD2OeDqkVz6e0Jcpktd
	 1fwsMhEthvVSkbfrFpYuuhKBCWqaKEq7kx8XJ8GGB9Fbsrw6l/bTQApAI3VSU8E3fu
	 60MEE696EcbmA==
Date: Tue, 01 Jul 2025 03:30:19 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alok.a.tiwari@oracle.com, conor+dt@kernel.org, andersson@kernel.org, 
 konradybcio@kernel.org, devicetree@vger.kernel.org, 
 linux-i3c@lists.infradead.org, krzk+dt@kernel.org, 
 wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
Message-Id: <175135861992.753883.14771836154436597983.robh@kernel.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_093024_752188_D8AAE619 
X-CRM114-Status: GOOD (  11.11  )
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


On Tue, 01 Jul 2025 12:48:50 +0530, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm I3C controller. This includes
> the necessary documentation and properties required to describe the
> hardware in the device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/i3c/qcom,geni-i3c.yaml           | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.example.dtb: i3c@884000 (qcom,geni-i3c): Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com

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
