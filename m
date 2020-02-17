Return-Path: <SRS0=EbLq=4F=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0295EC7619F
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 11:29:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C83C9207FD
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 11:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ao5TCRhC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C83C9207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23EV1EukivDBMX031UzLJM+aL2RLNrRpo5Ubypn+ecA=; b=ao5TCRhCCLH/Lv
	nQOSXlyaG/sLmD7l3LLqkAldphGVHkNLoAp7L5EnEkwj3mlQnPT0PjGs9c+sNVUeYV5dAJUqxR6dh
	MuS5V4Ls9C6J8H3s/OAM0KnIKAqYEoPN7hVBO6Xs+zxDeBmml/11symTHDj1hVW77kwulUX6SlGA0
	lOSu2sLLY+u8YQZbigi/UNNwkI4CPLThXwwO0YVRDDSjI1rIl/E1E8KvHcRrzvfxa0QYOHM8fP8qV
	DAbSc/CmTWiR4PH0vSV8SiF0KocTM2wFpA6jhTVaR+pVLCt/f/MO7lrNWqjQZL/kuohPSkWj1MDcx
	pxAGX5r4IT1V/9p2MZRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3eaV-0005V6-ET; Mon, 17 Feb 2020 11:29:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3eaT-0005Ua-9m
 for linux-i3c@lists.infradead.org; Mon, 17 Feb 2020 11:29:18 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D9D1A290C75;
 Mon, 17 Feb 2020 11:29:15 +0000 (GMT)
Date: Mon, 17 Feb 2020 12:29:10 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH] i3c: master: no need to iterate master device twice
Message-ID: <20200217122910.696f4fe4@collabora.com>
In-Reply-To: <CH2PR12MB42164D05C1C4353CAC9F4B75AE160@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20200214145853.24762-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWwXOb5vkexeop7zaqm7aUYcfMojVj+VrjuTUXJ+kaamA@mail.gmail.com>
 <CH2PR12MB42164D05C1C4353CAC9F4B75AE160@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_032917_477415_F427DC4E 
X-CRM114-Status: UNSURE (   9.25  )
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 17 Feb 2020 10:43:49 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> ++Boris Brezillon,
> 
> Hi,
> 
> I didn't received the patch neither is in pachtwork I3C ML, it might be 
> held on the server.
> 
> @Boris Brezillon: Could you please check it?

Done.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
