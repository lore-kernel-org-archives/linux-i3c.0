Return-Path: <SRS0=RUID=6A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6479CC2BB55
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2020 19:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37B8320786
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2020 19:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fUJ5/T/s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37B8320786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQBDdsPhFLPwbQRlMer0Lc3rcUXTVlzv+EeMTdy3sr8=; b=fUJ5/T/shxu9CJ
	lN2wu8Z0UsX0H4uOviAjDPdPi0vVeCceU6285i9fn575HsJ+ZCk3W6eoUKPTpgtT7bvl90FAfX0lI
	tWofZeordHL3vFw54Tg1qnvfCd10J5GUjY3iKEuzmCjQ98j0S9iaHOd2j6DkX7CvXdwoH21a9/da4
	sgGJE03oL5bz3+IKNQYWp+4948HFUEoJqsP8XVhmiytiX1FMCyviamgcARweYoi70MxsxNYWnio8D
	Er6oItGV7oT6twJWgamnYZqVknypA2saAriKoOOsQj4xl+1M7kdH10yPNQh3UmOsZekSk9gheON25
	g4PjLnSDMJlmIQNqSfNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPAUa-0003JL-Ec; Thu, 16 Apr 2020 19:48:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPAUW-0003Ia-0X
 for linux-i3c@lists.infradead.org; Thu, 16 Apr 2020 19:48:07 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8868D2A22C8;
 Thu, 16 Apr 2020 20:48:02 +0100 (BST)
Date: Thu, 16 Apr 2020 21:47:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Conor Culhane <conor.culhane@silvaco.com>
Subject: Re: [PATCH] i3c: master: Add driver for Silvaco I3C Dual-Role
 Master IP
Message-ID: <20200416214759.464139ca@collabora.com>
In-Reply-To: <20200411223843.631c7710@collabora.com>
References: <20200325160047.11082-1-conor.culhane@silvaco.com>
 <20200411140353.16872a7f@collabora.com>
 <20200411223843.631c7710@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_124804_183527_B6B141F3 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sat, 11 Apr 2020 22:38:43 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:


> +#define I3CS_CONFIG                            0x004
> +#define I3CS_CONFIG_SLVENA                     BIT(0)
> +#define I3CS_CONFIG_NACK                       BIT(1)
> +#define I3CS_CONFIG_MATCHSS                    BIT(2)
> +#define I3CS_CONFIG_S0IGNORE                   BIT(3)
> +#define I3CS_CONFIG_DDROK                      BIT(4)
> +#define I3CS_CONFIG_IRAND                      BIT(8)
> +#define I3CS_CONFIG_BAMATCH(x)                 (((x) & GENMASK(7, 0)) << 16)
> +#define I3CS_CONFIG_SADDR(x)                   (((x) & GENMASK(6, 0)) << 25)

Just learned about the FIELD_{PREP,GET}() macros [1]. If you use them
you'll just have to define masks here.

[1]https://elixir.bootlin.com/linux/v5.7-rc1/source/include/linux/bitfield.h#L92

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
