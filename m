Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB328CAC586
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Sep 2025 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZX8DpO+/o7oI/Vux+q+xQB8hN2WKahgZwkMDpUNFUyM=; b=WM6TN7aauY3LbPWR5b0rPDEOyQ
	BSCbY/aqbqKvDXd2hhTIW5OZnTkukwtyh4dwvYkZLOcHb2fNk2fS44mmwDNR2HbIaTkCaRD3MpDkv
	H/U328RKqe87yNQH208P1fjv+GiUQWYgCfLdMRsyh91OtE23+bwYwdPJGs/8koq86J/uKrExQrqvh
	87p19yAzt0EIiNYwkT78UKs9meHqtN7OPREMonI1HXq8gIQKJOsGG713/2cDY6rCeFIGlxi3L9cz4
	kHPVIJZC41Q2SN4K+qcmXxT6P+0FTDToU85YnkuLMKbEFtAGwKjlxBJLWY7W3LM6MRHzjSSfKwosm
	SoQwvuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgUk-00000001VGC-2BEf;
	Mon, 08 Sep 2025 18:21:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvceW-000000002B7-0DPP
	for linux-i3c@lists.infradead.org;
	Mon, 08 Sep 2025 14:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 070F2449A6;
	Mon,  8 Sep 2025 14:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1154C4CEFB;
	Mon,  8 Sep 2025 14:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757340926;
	bh=7YU1UeI4W5ZZgGKI5I9Pad1avQD9YJzn8mftLPPO940=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aBEMa3DLnFEhYE5MM8rXin/IPrmqiJAruTHxw1YMdy1L8IKc6Vl9ySelCceSeNJTW
	 TxPPJmu+AFBJXRNOodDcoGEkQchAqxW5lVzKMDUM1m5+gfp6ZfZaKMzBUgTj+ct8tt
	 tcIgRZNynayEmViK8GQTzTNHXelqkwAWOQ9gjDV4UqVSlxzxQGu1tRAmVWenUBCWTZ
	 XS/GCCnU2vPzxhFSDjdZCB8H6JM+Lh+c3JgcHluOyFm5Be9LHw52H1ak2yIpt1Jei9
	 kFKN0+DYjUmbs5iNskMYMVmVvUqk/a0IREvZnQEmDPvVoG/YINVTqRlsqQ/QBMH9E8
	 c6HwqyEHkryAw==
Date: Mon, 08 Sep 2025 09:15:26 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: manion05gk@gmail.com, conor+dt@kernel.org, 
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 gustavoars@kernel.org, linux-i3c@lists.infradead.org, srinivas.goud@amd.com, 
 alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, kees@kernel.org, 
 michal.simek@amd.com, shubhrajyoti.datta@amd.com, git@amd.com, 
 jarkko.nikula@linux.intel.com, Frank.Li@nxp.com, 
 radhey.shyam.pandey@amd.com, krzk+dt@kernel.org
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
In-Reply-To: <20250908112117.205270-2-manikanta.guntupalli@amd.com>
References: <20250908112117.205270-1-manikanta.guntupalli@amd.com>
 <20250908112117.205270-2-manikanta.guntupalli@amd.com>
Message-Id: <175734087989.1809191.3813013625215736173.robh@kernel.org>
Subject: Re: [PATCH V5 1/2] dt-bindings: i3c: Add AMD I3C master controller
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_071528_115050_AB67E236 
X-CRM114-Status: GOOD (  11.66  )
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


On Mon, 08 Sep 2025 16:51:16 +0530, Manikanta Guntupalli wrote:
> Add device tree binding documentation for the AMD I3C master controller.
> 
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
> Changes for V2:
> Updated commit subject and description.
> Moved allOf to after required.
> Removed xlnx,num-targets property.
> 
> Changes for V3:
> Updated commit description.
> Corrected the order of properties and removed resets property.
> Added compatible to required list.
> Added interrupts to example.
> 
> Changes for V4:
> Added h/w documentation details.
> 
> Changes for V5:
> Renamed the xlnx,axi-i3c.yaml file into xlnx,axi-i3c-1.0.yaml.
> ---
>  .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/i3c/xlnx,axi-i3c.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250908112117.205270-2-manikanta.guntupalli@amd.com

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
