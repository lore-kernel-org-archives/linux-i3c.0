Return-Path: <SRS0=NTCG=AY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F468C433E0
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2020 16:51:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F002D2067D
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2020 16:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BDFCHy7W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F002D2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hqxPA3kgCs/yWqec6glQoPlmc7kJ3KevbkFsy54ZeN0=; b=BDFCHy7Wt0JrDWNjnrBRBOTpX
	rl3EYL7mvHxGTeVkL6+kKx2GnMpGzUGjTafPfrZdBj90Vugo3uO8pbXZWtZRA/KtxIOC/LilALqrK
	7Jwc8vcjcuOgUSiiFr1eC1x0c6bheY740azec5cw6jAqaJ7KxtWyB3DW0amEnDZ/Lz1rPek/L8IR3
	Ai/iUtI2z/ja1ucOyVgvMzOqkpdMSpgoEiGBqI6Tq+NlQJOiN2iwHEXewIKj8nfuctc6SezrDCk34
	2upeGD2qKFU1oKbVTFKK4ofjsGBBznXAG8m/qx3ckskMLSc98DU3H958bqmPXM3+QOEteIdxgNqmB
	DNwZgYR6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv1fw-0003K6-Aa
	for linux-i3c@archiver.kernel.org; Mon, 13 Jul 2020 16:51:32 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv0Ry-0004K9-ST
 for linux-i3c@lists.infradead.org; Mon, 13 Jul 2020 15:33:04 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 9B2A62E2;
 Mon, 13 Jul 2020 15:32:56 +0000 (UTC)
Date: Mon, 13 Jul 2020 09:32:55 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: [PATCH] docs: driver-api: i3c: Replace HTTP links with HTTPS ones
Message-ID: <20200713093255.0a181730@lwn.net>
In-Reply-To: <20200713112657.33694-1-grandmaster@al2klimov.de>
References: <20200713112657.33694-1-grandmaster@al2klimov.de>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_113303_182184_D0374052 
X-CRM114-Status: GOOD (  12.22  )
X-Mailman-Approved-At: Mon, 13 Jul 2020 12:51:31 -0400
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
Cc: linux-i3c@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2020 13:26:57 +0200
"Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:

>  Documentation/driver-api/i3c/protocol.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/i3c/protocol.rst b/Documentation/driver-api/i3c/protocol.rst
> index dae3b6d32c6b..02653defa011 100644
> --- a/Documentation/driver-api/i3c/protocol.rst
> +++ b/Documentation/driver-api/i3c/protocol.rst
> @@ -14,7 +14,7 @@ collisions are prevented, ...) please have a look at the I3C specification.
>  This document is just a brief introduction to the I3C protocol and the concepts
>  it brings to the table. If you need more information, please refer to the MIPI
>  I3C specification (can be downloaded here
> -http://resources.mipi.org/mipi-i3c-v1-download).
> +https://resources.mipi.org/mipi-i3c-v1-download).

Applied, thanks.

jon

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
