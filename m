Return-Path: <SRS0=Yvk/=HH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA1AC433DB
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Feb 2021 21:31:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8D364E33
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Feb 2021 21:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F8D364E33
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GHHaudDdLeLJqDBigbulaYbVJ24nx+TWIIolG6MY3Ts=; b=LZn0vjkULAMY9v8Deh6IWAP07
	xymxuylgioRIvrLVuDtlzalINBI56lOIsVZUngt+9LV7DPXDEvQtAIqHkmFHq8Dsg/qwWxfvKC/Ls
	CX0C4CiVWOTHdkSt9kQo2ZR4bPj4/Uzwtv/U59VYsJILKaHfuBxwuSOdJYMexLrmpAJp15FrOXCJq
	mh4eDUCYSQCIe6Oxxs5O1XlN6/0+DHLF2mag4u+ht1Lgy0TDLZakd4zvfaSNRNnlZhf5zqE2xjocq
	QQH9x7/9ZkyMRx+9ICGsWGVQD2S3qX/svUtWAjVqGP820A3a11/RycNepo4plupfDdSNF1iP7Agxn
	t7Ica9wUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l88hc-0001FL-IA; Fri, 05 Feb 2021 21:31:44 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l88ha-0001F1-36
 for linux-i3c@lists.infradead.org; Fri, 05 Feb 2021 21:31:42 +0000
Received: by mail-oo1-f53.google.com with SMTP id y21so1979829oot.12
 for <linux-i3c@lists.infradead.org>; Fri, 05 Feb 2021 13:31:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=51yMkEGX5IS1Ajpcy4ttPstNBwB1noi6PUvzP4p9kZM=;
 b=gJbJP3ehafewwRZP6eO1e/NrSF9W1lBDg+mWU5GWczQNqN8Netcb5suE6Owe3Y0Sne
 cKKXlYSDX1xdbqp9NsFRjnFzNrY/39iG5EwM2xTl+HYNm6EpnAUNEl9Rouz6j82iBxhK
 ghOGiIFnd8+tTjQXt6+ZOGS+brLdLAz5JB3TEyMvk2fJW+bVylWhBZsc5sM/nw4LO0wO
 Ojx08NiJ35DiYpSr+fMIcSJG1TWbJKpvFVkAl6bKyh5ONyhm5pmH7fhxXLKqvSzc+usK
 ikgLUERxN2pzTIRdcpzRQpq9lwBCKiYPrgM2OEz+RgW3pET3aZj8bOqt8gFtX02Q3d8x
 8G1g==
X-Gm-Message-State: AOAM532Nh4W85sPTTcx0U7Hzj7fHI/XlKVPb9nWlvH46O2rWpbJEROXf
 pj8+AoUkU9nvZtOqGwDIyQ==
X-Google-Smtp-Source: ABdhPJwARWPCShOnAAQiNyWPIzvQa48JBNir8z43ORo9IjaIWHeK4CPbEVN6ZK6jgChUa0NRGo0xdQ==
X-Received: by 2002:a4a:e9f2:: with SMTP id w18mr4983914ooc.88.1612560701290; 
 Fri, 05 Feb 2021 13:31:41 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y22sm2041130oot.7.2021.02.05.13.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 13:31:39 -0800 (PST)
Received: (nullmailer pid 3782753 invoked by uid 1000);
 Fri, 05 Feb 2021 21:31:38 -0000
Date: Fri, 5 Feb 2021 15:31:38 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: i3c: Convert the bus description to
 yaml
Message-ID: <20210205213138.GA3782695@robh.at.kernel.org>
References: <20210121101808.14654-1-miquel.raynal@bootlin.com>
 <20210121101808.14654-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121101808.14654-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_163142_156661_73158826 
X-CRM114-Status: GOOD (  10.05  )
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

On Thu, 21 Jan 2021 11:18:03 +0100, Miquel Raynal wrote:
> Attempting a conversion of the i3c.txt file to yaml schema with
> minimal content changes.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i3c/i3c.txt | 140 --------------
>  .../devicetree/bindings/i3c/i3c.yaml          | 179 ++++++++++++++++++
>  2 files changed, 179 insertions(+), 140 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i3c/i3c.txt
>  create mode 100644 Documentation/devicetree/bindings/i3c/i3c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
