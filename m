Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A688FC7115B
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Jun 2025 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Zm3JyFCczm0nBhmVBuZ2VdQiIu8sD+mFRs2ZJw1958Y=; b=OM1KEadueL7cfc9hxX4yFxha7X
	1eYI2sziD5+yehpLnAPxN2WiLeq8WZTk2WgM0G9mlrAyMygJ37MmUSxkkPSsM8uT3RQ16K2GSdpZo
	tGl85CV57LyLIzzC1ymdRwfWz7TrNfgTJGkN5tK1wAcFcm8FPcj+uO9T/COqJSSiMh+jABa0moSNk
	O1nQUJ3ZcOpQj85skSggc8Ws7Co00nFlypeEG+IwUSrT9axg6GV0C90y2XXCmZE+5NXloSeapL7Tb
	MTl605VpG6NmqNOdIPypeOkVGW1OKK3WmTT4rSStcQn0BmOczkvysQkrHop5+/d+FL+44vrNEGcz6
	nlh9pUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoNi-00000009RlN-1pWv;
	Wed, 18 Jun 2025 08:42:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoLZ-00000009RRN-1qq5
	for linux-i3c@lists.infradead.org;
	Wed, 18 Jun 2025 08:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFA774489E;
	Wed, 18 Jun 2025 08:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585CDC4CEEF;
	Wed, 18 Jun 2025 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750236040;
	bh=1xFjpqsiK1UQYwyyiXC7mYzP6CcNQH5rmkYvgPQmtGg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GVuwr0KjCRZ1NH1xzWexV2R1TcXuvv24Ddgi5wlPOmSPEAaqYSrbsAqZ2laqO95f4
	 nhmBwJ+74tD8AyWVhNTsTdRXNgD9qu3zaNvrW04HR8UCbycQ5m7X/IHI+Jr579yBo1
	 ZdyJuwnLP20+a0fw2i9sJCnP5sOnLG3vhnkxXRdMfFy0epeQsXPitLbUBR/0k8B75P
	 y7L5LDEr+lqHMqMyA/ydsYt7dTWlmXz7+A6FZVwm+WMkp7tZ41cFOFP14owhTIsgjM
	 lYBM1QlYX5ZTaDrbRDm79b3i24TOJ6KfvrFihAsOnJ16VFYCtyefwLz160Fs77kiiy
	 KyWb8Eg3xYOeA==
Date: Wed, 18 Jun 2025 03:40:39 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, gastmaier@gmail.com, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Jorge Marques <jorge.marques@analog.com>
In-Reply-To: <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
Message-Id: <175023603936.750172.15809343122614690485.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add adi-i3c-master
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_014041_501412_9EC9AEBE 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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


On Wed, 18 Jun 2025 09:16:43 +0200, Jorge Marques wrote:
> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> core that implements the MIPI I3C Basic controller specification.
> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 68 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i3c/adi,i3c-master.example.dtb: /example-0/i3c@44a00000: failed to match any schema with compatible: ['adi,i3c-master']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com

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
