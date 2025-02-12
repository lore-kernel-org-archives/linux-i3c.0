Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBCCC02198
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Feb 2025 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OUsHfB7sVZFNQhpD/9z54aeMAYKjNMPY3kbVGjpf5T4=; b=sizPHQeYm6ItSrw/qTpIrp4FWb
	0IV7IPo5EhoFfRbXgPkM2+wi18hBP5d4NYhE+8/PdObgW5WtI2hFz426kCvMax0l+tYzxr65qayWT
	ujSdowWL8k/DNTXd5bct7ea19lK0o8Xl6N4K5hKyMXxxzuEsNBQv/GewEKLn7HMO81tj1/IJ4TIiU
	ckBjolub/8+xroxsQCe2M89mC394Tc9YZJATVhwLEis/zFHdWNDYYiAb96fhG10k7Xhh7QHVvYdQL
	9MJEl/4C4M+NWlRAP8kOVAzvXUEHP7fyNLfzaL8u9wYEv1qtzmu4MoIBig8A/lz9JDSsuzXvcq/Ob
	pavo9HRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEds-00000007qbJ-2neN;
	Wed, 12 Feb 2025 15:27:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEcU-00000007qJM-2dbl
	for linux-i3c@lists.infradead.org;
	Wed, 12 Feb 2025 15:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83A18A40B4C;
	Wed, 12 Feb 2025 15:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D831C4CEDF;
	Wed, 12 Feb 2025 15:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739373945;
	bh=GtFDGbP9nNjWeYtJye1vewMcoENRKBgAVsqnzgxSgI0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iseFGePcPYC/R6Y61oF51a8Eq7LoH0srFdcyV33nu3JJam3BFkhVV22B3vM3kNvtk
	 Zzj9PBz8tR1DWLNdFuKZmymt4ucCtHu2JGlYM0ZLGtugDtTpIz1GBm0y0+VV9+pu2i
	 fKvVMqQpAWCL51xLfc0Ls7v1NY9rsK15n4b8kOfeZwGCBBXjjhqc0Xw19GLKZFUrp7
	 PBOOTimy65S1sjaj4VVoR8xVKuxfYpX2vPTHrXRkNufaOV8g+QHX966+i8ofXQ2ad2
	 dZvfNftc3PF0pBSPb4j36vUE6e9o+qTdqTeQX8jJ/yg1o9h6EjBMhBmdVebpUA3Hh6
	 kYjDPw7i+1v0Q==
Date: Wed, 12 Feb 2025 09:25:44 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: shashank.rebbapragada@nxp.com, Frank.Li@nxp.com, krzk+dt@kernel.org, 
 conor+dt@kernel.org, priyanka.jain@nxp.com, vikash.bansal@nxp.com, 
 alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
In-Reply-To: <20250212132227.1348374-1-aman.kumarpandey@nxp.com>
References: <20250212132227.1348374-1-aman.kumarpandey@nxp.com>
Message-Id: <173937394410.3824870.14744594873271734768.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_072546_802424_0A9038E2 
X-CRM114-Status: GOOD (  10.41  )
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


On Wed, 12 Feb 2025 15:22:26 +0200, Aman Kumar Pandey wrote:
> P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is multiport I3C hub
> device which connects to a host CPU via I3C/I2C/SMBus bus on one
> side and to multiple peripheral devices on the other side.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> ---
>  .../bindings/i3c/p3h2x4x_i3c_hub.yaml         | 404 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 411 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml:6:1: [error] syntax error: expected '<document start>', but found '<block mapping start>' (syntax)
./Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml:251:111: [warning] line too long (118 > 110 characters) (line-length)
./Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml:260:111: [warning] line too long (111 > 110 characters) (line-length)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml:6:1: expected '<document start>', but found ('<block mapping start>',)
make[2]: *** Deleting file 'Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.example.dts'
Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml:6:1: expected '<document start>', but found ('<block mapping start>',)
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250212132227.1348374-1-aman.kumarpandey@nxp.com

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
