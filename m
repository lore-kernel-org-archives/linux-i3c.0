Return-Path: <SRS0=Yvk/=HH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D465C433DB
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Feb 2021 21:32:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D294D64FB2
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Feb 2021 21:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D294D64FB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ru7MNrPBldpvRjMgSu95lt5G6pf72cNQUTYyBlV3plk=; b=1cjfTVBtJY/7kxPr0TI+rRlUm
	yH0vqfzDCsBpx0eDG15yKJATWnnyno3JP9OCHeEGZ+GnjnD3TZQR4U6BCDGCfZaKdmn0173f7G8k/
	LihrjvJdX7JyY+kmAsisLsUScvRajf6l8xdsnchCdu+pJOByKXKj9yCb7HDa9DJBzCAXdb5MbkuMv
	ExNQHmnfUkH7JT9bhEvpqtRTdhPlTmBQVr07xzfTvyfh/MRyAAI39zpeSizMzKaqbPnm3UMKA97fG
	l2tR4B7QyNnmbYHDBmeYGT/8mgqdLLm1kZqEmHrLhE9irzcG+D4OY491B5GiCF/y376+qwJrQvYlT
	dFbDA8EEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l88hw-0001GU-Ty; Fri, 05 Feb 2021 21:32:05 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l88hu-0001GA-Qt
 for linux-i3c@lists.infradead.org; Fri, 05 Feb 2021 21:32:03 +0000
Received: by mail-ot1-f45.google.com with SMTP id o12so8243530ote.12
 for <linux-i3c@lists.infradead.org>; Fri, 05 Feb 2021 13:32:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FXxaKW4VvKFg/azx1hd5YtFoLVSQBmuXnkslcXmlnpM=;
 b=eTMKMYlyEU6GleLK7bzcvXlCKvLITRezQm4emArI92R8PZDSS+il5WPVPTbK9tuRCe
 EDoiUnrDkx+fDtU6NCTmPR9dp1qPjmaUtxEaZjVrYaDCh9hI53CnHIfNkuHayOqm9dAZ
 XVcZdN5Aj1GLqokcrWV4YgDMfw7lp0MifGUJ2n7y/0sOkA76cxcObrdlYqVCPdi6hcJO
 OJqs6cGqjj9b430+1ApLsdC8815qmrlNbID2CofpYW2zka1A0JGl3RGaR3ZZlAGw8tVh
 ZJD/sNx7HqNbHiKEY9ySrCo6YRgztD6auGkk0nLzV8fDYynBYqmn2huxam/IORn2kBV0
 iGQQ==
X-Gm-Message-State: AOAM532bKTn7zCpvNGBiesInondFQG/A2IPU/2ebjk/tyzTt7kY6aiAo
 Pq87NPAfnaM8QSiq1HLXLA==
X-Google-Smtp-Source: ABdhPJyLxsCxCQYVcYCoFPBWYTjINWA8T33p9CWzmd/78jVEQ/YdEgr+ItI/3X3pRkIZmpM47dAcoA==
X-Received: by 2002:a05:6830:233a:: with SMTP id
 q26mr4593782otg.151.1612560721877; 
 Fri, 05 Feb 2021 13:32:01 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s189sm2011082oif.19.2021.02.05.13.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 13:32:00 -0800 (PST)
Received: (nullmailer pid 3783400 invoked by uid 1000);
 Fri, 05 Feb 2021 21:31:59 -0000
Date: Fri, 5 Feb 2021 15:31:59 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: i3c: mipi-hci: Include the bus binding
Message-ID: <20210205213159.GA3783349@robh.at.kernel.org>
References: <20210121101808.14654-1-miquel.raynal@bootlin.com>
 <20210121101808.14654-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121101808.14654-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_163202_903781_9A9427D4 
X-CRM114-Status: GOOD (  11.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 21 Jan 2021 11:18:04 +0100, Miquel Raynal wrote:
> Update a little bit the content to match the bus binding, including:
> - the node title should have been named after the description done
>   in the historical i3c.txt file, ie: i3c-master@<address>
> - child nodes should be accepted even though the drivers do not currently
>   support it
> - #address-cells and #size-cells are also mandatory and have specific
>   values
> 
> Cc: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
