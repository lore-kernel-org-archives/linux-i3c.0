Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04588D116EA
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 23:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wh7Sxggm11NALKJoKtgWQ6f+pxOWaYOUl+LxathEkO4=; b=NB7Dfde2t4mGjz
	NJWKtfB+8MrPUf5Zs1C7CZ+Nb5niuYg76esPh0Gl3xKl0rqGvEBwyc90mvCerI8SLJe6K7sBolOvY
	ZR1Wu0l1hCtzHn6Q7E9upGuD6RDq/tntkD6J9svZWsDupznKFFbvxUhP+PlQUCFXgKVWeQVbrHkEf
	lLrl1lWLdQGYWUWU2TTHeiuTVMLpzRBULGI2/Hyh5VVkKlcgoI3QwDYQObSsBD+AFZz4U2Zx3gDZk
	/3c9W/0DaAkJ0QM+tkyu2btHYYc380udGVPrOPRCZSauhAAmME3E+XWhIyuUwalvwtcyufnDhbYyE
	w7BGS4v2zM/x3Wgwuc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7sg-000000013CR-39N5;
	Fri, 28 Nov 2025 23:28:02 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7sd-000000013By-1xEL
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 23:28:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4948EC15D6B;
	Fri, 28 Nov 2025 23:27:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D62560706;
	Fri, 28 Nov 2025 23:27:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D950D10B025F8;
	Sat, 29 Nov 2025 00:27:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764372476; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=A76xFU324aR9yxe3hIEbvTdh3qQS7JiP/5wjrwFoSDw=;
	b=IG1j91GnXapobKbp8v4fDsLldOnzS/mGchKx2MjLePMCy1Y/WAO1WTUVCqNSlJVXTQ+5QL
	4GCE5esDTBT76HRKqGDHXok2AUotoQQmNjzI8qKJToYk+9hg8UX/4N4rQ1NEhIsXjsxjxE
	p43LgGhvRoqHRYFB610HQRr2iZbz6eHKBRRvkbTCtbuwoAc4ewTppk0lHV9BVgewmgeIPY
	MuWia1k637Ks104D5a1tfpjpiAHqP0ia0fJ4IyHFnWEsixmE4HkzLVlhgLHNn/3VG8Gf0u
	Ovb0vnS+NFod2bXJRCDf9jdTAuNpK1K1olk043O0TwgX1r+pQ7HEL2gpzjKMDg==
Date: Sat, 29 Nov 2025 00:27:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Jorge Marques <jorge.marques@analog.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	gastmaier@gmail.com
Subject: Re: [PATCH] i3c: master: Remove i3c_device_free_ibi from
 i3c_device_remove
Message-ID: <176437242363.884558.12871962485756677254.b4-ty@bootlin.com>
References: <20251112-ibi-unsafe-v1-1-d8454db22613@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251112-ibi-unsafe-v1-1-d8454db22613@analog.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_152759_660681_33637B0F 
X-CRM114-Status: UNSURE (   8.88  )
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

On Wed, 12 Nov 2025 22:30:00 +0100, Jorge Marques wrote:
> i3c_device_disable_ibi should be called before i3c_device_free_ibi,
> however, a driver using devm actions cannot yield the call before the
> bus_type.remove(), requiring to use a .remove method that is usually
> discouraged for drivers that uses resources already manage. Since the
> only consumer mctp-i3c.c of this method calls both
> i3c_device_disable_ibi then i3c_device_free_ibi, remove the call from
> the i3c_device_remove (bus_type.remove()).
> 
> [...]

Applied, thanks!

[1/1] i3c: master: Remove i3c_device_free_ibi from i3c_device_remove
      https://git.kernel.org/abelloni/c/5b9481a41571

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
