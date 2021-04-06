Return-Path: <SRS0=Nh6F=JD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67386C433B4
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Apr 2021 15:06:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA32613C0
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Apr 2021 15:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA32613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bMFhWrAHjK1mPnYzratj/XsnAZXKHP+vX3v49mgc/6M=; b=bUHo6ii5S/t39sTmKjfl6jX1J
	CWlAbSk0OjKXII92XYUPHxSBnOOGMIu9FYfRO/ZBVIGTe5yv9B9kntMpTtoKnX2qxSsaEtU7bgpsc
	GgsAuAjprFLWL9NpohQqUd9epVTCZRY6JWcLTVjh+d99Vg1er09UGjUrtrj8/LZxz6jzhrjmI/NBF
	VQTza53CGJDpSCy7iG7ppc96KFJBIa0buSk6HC1RlcJMLQ6Ys3RTUS9OwLitsc7u0M9CyCPpO00PR
	fbpKQi0WNBQheqgdFiyB3FwBLWUtQAqs3gv7tz0I9kYANo88tB2QkWHjbDeTQu7iH8nHkZ9tfU2AD
	RRv+vwn4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTnHM-002tfp-Al; Tue, 06 Apr 2021 15:06:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTnHJ-002tey-KU
 for linux-i3c@lists.infradead.org; Tue, 06 Apr 2021 15:06:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E7B5613C6
 for <linux-i3c@lists.infradead.org>; Tue,  6 Apr 2021 15:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617721562;
 bh=oKiK4ApC93CrUYa67wbve2zbWOPAYFHVj94zM59y+yQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aVshd5xxVxPYitoUYR9v9ig/rMRIKsxhG9scO2HkQvZSxqe7k9TWmpvZBZFP+PlOm
 Q6i6ghqzAQiZSY3QkacgL++PBoMOnRumNk+23sHS9yPK3o3HQ1Z8fp/nBhwOL3kHNr
 AMHM1TdiA/3m3wCPrLFfF0LSa7WQJ1AONtUx/1y821t5uhT3snuZYjGu/H7b1TUA7s
 lBi2VF1xmcj9qaIYudlFPUjjsO3LxI8xjo6FDlUpNlXaVhAQ4ncByOjGgv8G+0zh+S
 Mw26Ssg3BlccZTF88ndfAyygomisjQwXQiPzs6+QdKV3ryRVR20NPsQCKw552k8ale
 xFY+ZvvVRoI7Q==
Received: by mail-ej1-f42.google.com with SMTP id mh7so12512866ejb.12
 for <linux-i3c@lists.infradead.org>; Tue, 06 Apr 2021 08:06:01 -0700 (PDT)
X-Gm-Message-State: AOAM532H6wlHO5Fh2bh5fp77s5Y4qiA6VVNCv57Bn90xisGBlFL8r7cK
 +IQw0Bh/cBGDO6UFL8A2w3WCjmfgLgtM6GrASQ==
X-Google-Smtp-Source: ABdhPJyxyDKARhPWHu4Jr+PfqF7dmXdHRhFbxyLKg+KVWqXlE18eXrf8KY6IuCJJBbg7kaluABfeLXvlp8S1qatvsx4=
X-Received: by 2002:a17:906:55c9:: with SMTP id
 z9mr6780057ejp.360.1617721560689; 
 Tue, 06 Apr 2021 08:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
 <22b7b53af1907f7cae27e26be725470c04b84725.1617279356.git.mchehab+huawei@kernel.org>
In-Reply-To: <22b7b53af1907f7cae27e26be725470c04b84725.1617279356.git.mchehab+huawei@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 6 Apr 2021 10:05:47 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+d9nU8r_1tvrU9Yk4rCN3fve6D29JMLFN59jJxLWjhrA@mail.gmail.com>
Message-ID: <CAL_Jsq+d9nU8r_1tvrU9Yk4rCN3fve6D29JMLFN59jJxLWjhrA@mail.gmail.com>
Subject: Re: [PATCH 27/32] dt-bindings: i3c: update i3c.yaml references
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vitor Soares <vitor.soares@synopsys.com>, devicetree@vger.kernel.org, 
 linux-i3c@lists.infradead.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_160605_921460_9D9277E5 
X-CRM114-Status: GOOD (  10.70  )
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

On Thu, Apr 1, 2021 at 7:17 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Changeset 5e4cdca887fd ("dt-bindings: i3c: Convert the bus description to yaml")
> renamed: Documentation/devicetree/bindings/i3c/i3c.txt
> to: Documentation/devicetree/bindings/i3c/i3c.yaml.
>
> Update the cross-references accordingly.
>
> Fixes: 5e4cdca887fd ("dt-bindings: i3c: Convert the bus description to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt   | 6 +++---
>  .../devicetree/bindings/i3c/snps,dw-i3c-master.txt          | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

Ugg, I should have remembered this...

Acked-by: Rob Herring <robh@kernel.org>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
