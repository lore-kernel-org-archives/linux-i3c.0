Return-Path: <SRS0=vbyI=W6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C86AC3A5A2
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Sep 2019 10:52:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60DE422CF8
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Sep 2019 10:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZKJZjzpq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60DE422CF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBmTo4QABTpzZj2aWiJvLx4Jz1WYLNrMbjrKKmN5Kx4=; b=ZKJZjzpqLNrxOD
	HMCSX7TYgAKxj77o+rkRhdASZBuWEmg0YfT1+HdRBQNvAjAx8ANHAIyuUQ8turSs1qnzqeCeHOsdl
	rhp7jstgFO667tasgPdUoKpQnTaY3JkaMwEcbrB2y26RPGWBVUtyk8FFVle5k4F41u/6Cm1QV4m4x
	s3fOZj8QyBxydbwfC03KXqLrv/bMuTRcUYNVUqmL4nziTkQQrE1SG860iegrJjpDINUXPFWzdlDeD
	YFFcMN0XLayPCCrwApZQVuZAPVIU4aHwE+zRy7bnm2iaKr81nxt2T6re6amolTilVzXWQQe1End6C
	MFHehfYX6X9PbaiEybtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i56QY-0004vp-UC; Tue, 03 Sep 2019 10:52:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i56QW-0004ur-13
 for linux-i3c@lists.infradead.org; Tue, 03 Sep 2019 10:52:45 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C741F28D1C3;
 Tue,  3 Sep 2019 11:52:40 +0100 (BST)
Date: Tue, 3 Sep 2019 12:52:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v2 1/5] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Message-ID: <20190903125237.13a382b2@collabora.com>
In-Reply-To: <105a3ac1653e9ae658056a5ec9ddc2a084a61669.1567437955.git.vitor.soares@synopsys.com>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
 <105a3ac1653e9ae658056a5ec9ddc2a084a61669.1567437955.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_035244_204463_F87490CD 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Joao.Pinto@synopsys.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, pgaj@cadence.com,
 robh+dt@kernel.org, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue,  3 Sep 2019 12:35:50 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> On pre_assing_dyn_addr() the devices that fail:
>   i3c_master_setdasa_locked()
>   i3c_master_reattach_i3c_dev()
>   i3c_master_retrieve_dev_info()
> 
> are kept in memory and master->bus.devs list. This makes the i3c devices
> without a dynamic address are sent on DEFSLVS CCC command. Fix this by
> detaching and freeing the devices that fail on pre_assign_dyn_addr().
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
> Changes in v2:
>   - Move out detach/free the i3c_dev_desc from pre_assign_dyn_addr()

So, you decided to ignore my comment about leaving the i3c_dev_desc
allocated and skipping entries that don't have a dynamic address when
forging the DEFSLVS frame instead of doing this
allocate/free/re-allocate dance, and more importantly, you didn't even
bother explaining why.

I'm not willing to accept this patch unless you come up with solid
reasons.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
