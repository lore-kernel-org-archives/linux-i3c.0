Return-Path: <SRS0=e5ZX=RO=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA850C43381
	for <linux-i3c@archiver.kernel.org>; Mon, 11 Mar 2019 07:09:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B564C20643
	for <linux-i3c@archiver.kernel.org>; Mon, 11 Mar 2019 07:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tv8vtzWd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B564C20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvFv7MTa1XqSJVUjUC76QkCFqyvxGYtMmVyp7zc71T8=; b=Tv8vtzWdn1r6SQ
	91iqNMAP8Zbq6ElKoWNwvyY5p0fuGk3/2vNz7hgfOjGTAy/cDSZ9Il++8uRs/AZlLXUPgLJI1jUUL
	hmD/at1i2RnUl/H6EvoBkdhBxtV8M8Jm//DErPN/rKgiNVbKzECNy8nXjOi/urEM4Ne5WHiMKJ9UO
	55gNP2DCOVWn5Rym1GOJ7rq2sqv7qBWpWcsgy3uwAzcJ38re/eXyrh6M1j304eAGTtSdf0z29vu/0
	xNUVeTTBVvJJUPjnajsF6BQeNj0nRHRa+6915Se1/vAL9fzTmNsHH18UHoiqBGIbhRO9fHgZkMafq
	Ym2g+2XrwYwcUPYj0s6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3F4H-0002HK-9C; Mon, 11 Mar 2019 07:09:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3F4E-0002Go-RH
 for linux-i3c@lists.infradead.org; Mon, 11 Mar 2019 07:09:48 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 55D8227D615;
 Mon, 11 Mar 2019 07:09:40 +0000 (GMT)
Date: Mon, 11 Mar 2019 08:09:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH 0/4] Drop support for I2C 10 bit devices from I3C subsystem
Message-ID: <20190311080936.1888a16e@collabora.com>
In-Reply-To: <20190307095808.22540-1-pgaj@cadence.com>
References: <20190307095808.22540-1-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_000947_013587_86D8745B 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Przemek,

Missing v2 in the subject prefix, and there's no changelog in the cover
letter/patches.

On Thu, 7 Mar 2019 09:58:04 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> I3C MIPI spec does not clearly say that I2C 10bit devices are supported.
> Additionally, it isn't possible to pass 10 bit device properly through DEFSLVS
> command and reserve address for such device on secondary master side.
> 
> Przemyslaw Gaj (4):
>   i3c: Drop support for I2C 10 bit addresing
>   i3c: master: cdns: Drop support for I2C 10 bit addresing in Cadence
>     I3C master
>   i3c: master: dw-i3c-master: Remove i2c_funcs hook implementation
>   dt-bindings: i3c: Document dropped support for I2C 10 bit devices

Looks like this series is still not bisectable. Please make sure things
compile/work correctly after each of your change.

Regards,

Boris

> 
>  Documentation/devicetree/bindings/i3c/i3c.txt |  4 +++-
>  drivers/i3c/master.c                          | 19 +++++++++++--------
>  drivers/i3c/master/dw-i3c-master.c            |  6 ------
>  drivers/i3c/master/i3c-master-cdns.c          | 10 +---------
>  include/linux/i3c/master.h                    |  5 +----
>  5 files changed, 16 insertions(+), 28 deletions(-)
> 


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
