Return-Path: <SRS0=NTCG=AY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE43C433E4
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2020 15:29:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E26B820771
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2020 15:29:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QxpDFoxA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E26B820771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=859JdCBXOHe7st391grX5vep5DD7oeULE95ANGdAqKc=; b=QxpDFoxAO7I/O9OukLlsvZAB8
	pyV9oLMqij67FrfxfpwtCbSeXAKuUdqiatTiKTzU2fXP80TyHJCsVfAphPZudIF/BbNcAUAin6Abw
	STqJNV1OUjZwIWTlwlJXL3Cgf9W5eE5khslkLiTVfd6f8TKG4Mha+dGCh0uNXI4N1WDenq/JTn8QN
	Gp9Ac1I5JPLYkQMbmm0KkYZ0lZP5jyIslvsDwrObYxdwZqI7p8I0IJeE7fFJUN6cWyok4FUQcK1hp
	XhL8GmFd2e/zV0nPTYX/Mprp2Y46q22BDgrUosuwDDoHsz8QucI7WGghHNg40TZky+B4CrOPdgNnS
	Y6r/ksT9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv0Os-0003iF-AV
	for linux-i3c@archiver.kernel.org; Mon, 13 Jul 2020 15:29:50 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtZyG-0001rM-5y
 for linux-i3c@lists.infradead.org; Thu, 09 Jul 2020 17:04:29 +0000
Received: by mail-io1-f67.google.com with SMTP id d18so3121568ion.0
 for <linux-i3c@lists.infradead.org>; Thu, 09 Jul 2020 10:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6rPAal+mCKD1RasPvCnP9R4UBzZrvC6ReDEPohFK+PY=;
 b=Voo5K7SgytF5oMZoflaerDJeVrZ7SNUDE96KHxsThxAG9ZXSbq1Wt/JkKdN4Q9SGqM
 VAm9RK9mDgA5zQRCI2+gX+j0iCKYmDjnJXpugh+xEndY47u6PFQFIK7in1CYzKbv3TT/
 mqc5tywIy7CS9hSV68KeWXzXjv0sqXSdRGUSLI1FnqmSOpDgF+N7hNQ+C6AZmhJRfL6O
 EHMVbd41dum379vIRoL5LYZ8ygpD65OrR3LR27jUXrIXeId0VNFxSLZ4atrnSJ50ch2R
 RRcl/kZLflZePAQQguSFllW7R22VkI8tA5H87YQVrb1x5XJhegSoiNx/8iMqXieRAoLs
 JQyg==
X-Gm-Message-State: AOAM530RweYKKAGA7iBug5+62P/s1mO/KFotziO7qT2wwS1EP1Y6wpRN
 f3YVV1mIvdrGTgX9eiRpYw==
X-Google-Smtp-Source: ABdhPJxcDPa2tPUnhuBohvevfmSj6UngPYNU7IBK1nJG52EbsFCNEeMqhNHXUml2E//n3ivhfutJTA==
X-Received: by 2002:a05:6638:2649:: with SMTP id
 n9mr37848979jat.126.1594314267183; 
 Thu, 09 Jul 2020 10:04:27 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id f18sm2414188ion.47.2020.07.09.10.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 10:04:26 -0700 (PDT)
Received: (nullmailer pid 523550 invoked by uid 1000);
 Thu, 09 Jul 2020 17:04:25 -0000
Date: Thu, 9 Jul 2020 11:04:25 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/4] dt-bindings: i3c: Describe Silvaco master binding
Message-ID: <20200709170425.GA523194@bogus>
References: <20200709080159.2178-1-miquel.raynal@bootlin.com>
 <20200709080159.2178-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709080159.2178-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_130428_247874_08F365BC 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 13 Jul 2020 11:29:49 -0400
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
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-i3c@lists.infradead.org,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 09 Jul 2020 10:01:57 +0200, Miquel Raynal wrote:
> Silvaco provide a dual-role I3C master.
> 
> Description is rather simple: it needs a register mapping, three
> clocks and an interrupt.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/i3c/svc,i3c-master.yaml          | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/svc,i3c-master.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i3c/svc,i3c-master.example.dt.yaml: example-0: i3c-master@a0000000:reg:0: [0, 2684354560, 0, 4096] is too long


See https://patchwork.ozlabs.org/patch/1325811

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
