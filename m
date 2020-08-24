Return-Path: <SRS0=jjtB=CC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A124CC433E1
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Aug 2020 23:21:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 611AE20702
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Aug 2020 23:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uWSKrO4q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 611AE20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QzNsl9MqThKmBmVEgVUZkXkT0Gk4pXlg0fTQ/h1aWSg=; b=uWSKrO4qKSJZNZ5hrdBv0Q/Pd
	228o3kHa3lYU7hXNmpKolhVvi5Cd5bv9UwVDXMJit/pNs3/fLmnkmrIFRXYvIwEvey+//ZjMfKs+p
	NaCyjkdw4gjWbOCrnU2r7SxBb54eKSkzHRQG7D5lqxwNb/ZsnTnO2TUy0Sz3XowXxfxZ7ZBmBmXly
	sZGoSEWOsdFjZ2ACobxCQzxd+r21qj52l/Vhijtr2uKXATGc95EN+Whh/HLvvTqBBa7yH23Pmx8Wu
	7kHV7cz6yG/VlbXET0sy2YAV3l5zxMj9NT0ip3VITFN3HXA/1uM7CFjoAYfY8NFvf+KzUH+PB/0+V
	Ymr6nKrAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kALm5-0004OG-Kg
	for linux-i3c@archiver.kernel.org; Mon, 24 Aug 2020 23:21:13 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kALm3-0004Nc-MB
 for linux-i3c@lists.infradead.org; Mon, 24 Aug 2020 23:21:12 +0000
Received: by mail-il1-f195.google.com with SMTP id f75so8540605ilh.3
 for <linux-i3c@lists.infradead.org>; Mon, 24 Aug 2020 16:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dHT21K2ThCYKCWY29jE8gV7M7hztSi8jrOrYJdoMcr0=;
 b=Nth/sRzzz8Bag794hY3JEFpjBk5CF+MSHjmr53epXuZHFjidr9eHleSR/JMjElxclu
 JY4r15kY3HPJ/RnX3FqA5qfr0tRa0Jmxt2Ih+VjTLlbmKn7gM33ZBmPy6o4Pn1aQrL/w
 67OOOnbvEGoazHdMjbD7ZFE36PQCLTMmkqvxTiB6kfth49Blff/SaY8546rSATxr3Cp3
 ykH5cWrlNoBQS1FSijx5ac9v0h0kl6Fp45SpTQseZg2yTuVXLvFQB66y1sulZAQSZA1o
 Q5xZgo0AuyG2XUlHINsmp3ZBiwWBsVgzSgUet6/n5g9iyyHr6HNn+30i7iBDq7qVd+UK
 +inQ==
X-Gm-Message-State: AOAM533qeGmFkNdl6K7jwtMOmkiCtOzE9nyDd+jEqScV50BkFgx42bVV
 o34XbrFKIo17WFaMeg1g8w==
X-Google-Smtp-Source: ABdhPJwiumbOUZIb5eWkoPu21UOZDeJrET/huZ74qaDExYc53dFYCFj1qMLSr538p/WawFhjmM5vhg==
X-Received: by 2002:a05:6e02:134e:: with SMTP id
 k14mr6989994ilr.271.1598311270740; 
 Mon, 24 Aug 2020 16:21:10 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id a11sm7966826ilh.74.2020.08.24.16.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 16:21:10 -0700 (PDT)
Received: (nullmailer pid 3525044 invoked by uid 1000);
 Mon, 24 Aug 2020 23:21:07 -0000
Date: Mon, 24 Aug 2020 17:21:07 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: Add vendor prefix for Silvaco
Message-ID: <20200824232107.GA3525014@bogus>
References: <20200812141312.3331-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812141312.3331-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_192111_766221_033721CF 
X-CRM114-Status: GOOD (  11.58  )
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
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-i3c@lists.infradead.org,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 12 Aug 2020 16:13:09 +0200, Miquel Raynal wrote:
> Silvaco, Inc. is an EDA provider of software tools used for process
> and device development and for analog/mixed-signal, power IC and
> memory design [1].
> 
> [1] https://www.silvaco.com/company/profile/profile.html
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes in v2:
> * Change the prefix 'svc,' -> 'silvaco,'.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
