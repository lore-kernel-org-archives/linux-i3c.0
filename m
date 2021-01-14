Return-Path: <SRS0=rmHr=GR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBAEC433DB
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Jan 2021 22:54:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3580A2389B
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Jan 2021 22:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3580A2389B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdhyay0leOsTvhy3rJPSD5+77ADAuDyWEuv85qbe11Y=; b=PErfFuAn9X0NiM+Tx+TFKpDHaC
	0BV3eujcaHPFkpRuteqXMYQDWqVFhfrZx4MM9NAYe+ubLf9Jn7ugRpJ6Zw1NIq/9jy+xTnRnx/IMu
	UWt6F6C1SuXhckYS8U9A1OQoiyipKJpz4C3L999QiqhTDmV495OZJk3idTz8mJ4DOm6ffUeBiVdkj
	eL7VnfnBdnyZ5apQPx1glVfH1b2xEW8VsPsxHabpl1AHGDMEdrSfAxfM34WmYzBWjTWZl+c2Uj9G0
	Kk1OHATQ1QdyzjbtWhhvua10u1E+SNpy+jUZG3xAc8Gru5EqWU8XMP5RM5HZEXCU9PRj4V3M8CtFr
	OWkFzarw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0BVQ-0003eV-BH; Thu, 14 Jan 2021 22:54:16 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0BVN-0003dp-J4
 for linux-i3c@lists.infradead.org; Thu, 14 Jan 2021 22:54:14 +0000
Received: by mail-oi1-f180.google.com with SMTP id x13so7675008oic.5
 for <linux-i3c@lists.infradead.org>; Thu, 14 Jan 2021 14:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Kdgl7+Fa7dWGmuWmJbJhRTe7pZgtvLwB3nP1BFK9Eqo=;
 b=gRSfH/Yl8CfbKsaph8qYk45J72Mj0FV7RUwTIEYo8XXSyBcpwz74ThgsPzmW+6/XRJ
 VvqLwtY/PELNjJDVhsqE07GkvrgzKU19zsqHtUokWGlV3e5xrNiVlt7/QndHUt8KQskn
 OUojaXu06BAaRLC5YXGtmJsbSIAOhuefSCE+XF0GnQSlQ+sy7+k6eO8lW37PKvD2xg/Z
 hHqwodfk8+kBxrkjsmSR1RgswGjKpTwHFRrD7ZFfqGQ4jmlyxoisTuI4CTzctTrE/oZR
 nz1i3jikvWfyvHBwI62KiklrPLFD5RJaFvDwctL/RKuX9y21DjsYZUPF/PFfjdfWX/pg
 /QoQ==
X-Gm-Message-State: AOAM531WSag7khD23KzpUPeTBk5R6z+1dGOy9jXVvluY7aKMqbcBBP8h
 i1xu8WeKDTI0DNetXeNaWw==
X-Google-Smtp-Source: ABdhPJxX0hsXcnXhp0j1DKNnifjBSW7maUvWsBr3msRS5zWljWKhIlnx/7lYxnI84yMzgGwtFefTkg==
X-Received: by 2002:aca:4f97:: with SMTP id d145mr3914920oib.123.1610664853033; 
 Thu, 14 Jan 2021 14:54:13 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t13sm1322353oih.26.2021.01.14.14.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 14:54:12 -0800 (PST)
Received: (nullmailer pid 3797272 invoked by uid 1000);
 Thu, 14 Jan 2021 22:54:06 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <20210114175558.17097-3-miquel.raynal@bootlin.com>
References: <20210114175558.17097-1-miquel.raynal@bootlin.com>
 <20210114175558.17097-3-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 2/6] dt-bindings: i3c: mipi-hci: Include the bus binding
Date: Thu, 14 Jan 2021 16:54:06 -0600
Message-Id: <1610664846.690698.3797271.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_175413_736637_A0A36C27 
X-CRM114-Status: GOOD (  10.10  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Nicolas Pitre <nico@fluxnic.net>, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-i3c@lists.infradead.org,
 Conor Culhane <conor.culhane@silvaco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 14 Jan 2021 18:55:54 +0100, Miquel Raynal wrote:
> Fix a tiny mistake: the node title should have been named after the
> description done in the historical i3c.txt file, ie: i3c-master@<address>.
> 
> Cc: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.example.dt.yaml: i3c-master@a0000000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i3c/i3c.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.example.dt.yaml: i3c-master@a0000000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i3c/i3c.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.example.dt.yaml: i3c-master@a0000000: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.example.dt.yaml: i3c-master@a0000000: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml

See https://patchwork.ozlabs.org/patch/1426584

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
