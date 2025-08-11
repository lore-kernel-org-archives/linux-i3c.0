Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0065C87FD2
	for <linux-i3c@archiver.kernel.org>; Mon, 11 Aug 2025 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QaeLYwNYF0IEM9em9sXzfYL454JxmkSRMxE20E/Yj/0=; b=dIucy3eZLooJmxQIE36SCRc3Wb
	fNeb9rxJS0MgYtYm0JxXokXvmHWjWPPTJY9EXQiaC81PWT2TSPVsxKVgxAtyQSJAgIHMj6YF18OeH
	YUjjg//j0RLPjWZK9R6XNy3W6N0aMsryZ/T9jgLfm7qCo9okyYPE49ROPFzYR9z9lhO7kv9ZeYMjo
	ukN8X+oTYIR17Uo3KJeK8nITdHoVXj7rKuss/4MBIpsT/flGwguJNldc0zY1yBOKAN4ArAqr0a8xv
	nrelksE9aC+6Qcg6DL5bcvPE4ZHAfjH6dWxpAEsOvVBKqI5OI29SbO3FwyB22q/MpqdjUgRb551Ix
	cNIiOvzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRkH-00000007gV7-2qdx;
	Mon, 11 Aug 2025 12:35:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRkF-00000007gUh-1MBD
	for linux-i3c@lists.infradead.org;
	Mon, 11 Aug 2025 12:35:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A0F743B55;
	Mon, 11 Aug 2025 12:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEA4C4CEED;
	Mon, 11 Aug 2025 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754915718;
	bh=xPf4hCC+HgEef5Swn5jiIwNVTgFJh8/Tr7iUx6FhQlg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RrKiPp4YR+5UeVQhTjhRrBfrjt3LLrtXkBjI/ArUI8iUHWWLWydGFkIJ0/Ok4C+Hh
	 diETbZpRXWj7m59Or5GQB5aZeUM2gjRskoVrzX9FGYb4sen0D0AqLBwWxjVwoiEnR5
	 fSJtbe7ca9YDDUYe0DqXHEUaPq3kIuqUntxTpKAywwqiH0N0TTNkSU916d5t344/6E
	 I71IpiMPERo83GlO6T5KsAFtykIjAMki2bKfjzu/MWg4yaiklQa6DSS5aZDPOarxnz
	 xWt7ftlMe9SNZjflZNea7+wi/+G9x5StNenrX1yjGZtSmYRDVauwby5kVJGJYyUhNo
	 MbTQntPCDE2DA==
Date: Mon, 11 Aug 2025 07:35:17 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, alexandre.belloni@bootlin.com, 
 devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@nxp.com, 
 priyanka.jain@nxp.com, vikash.bansal@nxp.com, linux-kernel@vger.kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, broonie@kernel.org, 
 shashank.rebbapragada@nxp.com
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
In-Reply-To: <20250808132033.3996614-1-aman.kumarpandey@nxp.com>
References: <20250808132033.3996614-1-aman.kumarpandey@nxp.com>
Message-Id: <175491571725.2516426.3535387819811029037.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_053519_406734_38E764CC 
X-CRM114-Status: GOOD (  10.97  )
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


On Fri, 08 Aug 2025 16:20:32 +0300, Aman Kumar Pandey wrote:
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> 
> ---
> V1 -> V2: Cleaned up coding style and addressed review comments
> V2 -> V3: Added mfd device support for i3c hub and regulator.
> ---
>  .../bindings/mfd/nxp,p3h2840-i3c-hub.yaml     | 320 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  2 files changed, 328 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml:32:4: [warning] wrong indentation: expected 4 but found 3 (indentation)
./Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml:166:111: [warning] line too long (118 > 110 characters) (line-length)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml:
	Error in referenced schema matching $id: http://devicetree.org/schemas/mfd/i3c.yaml
	Tried these paths (check schema $id if path is wrong):
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/i3c.yaml
	/usr/local/lib/python3.11/dist-packages/dtschema/schemas/mfd/i3c.yaml

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml
MAINTAINERS: Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250808132033.3996614-1-aman.kumarpandey@nxp.com

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
