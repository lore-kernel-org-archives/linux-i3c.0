Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23CCC87FCA
	for <linux-i3c@archiver.kernel.org>; Sun,  3 Aug 2025 21:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InqcmbMgCYvO1IE9XtcnvYgczH4tMVBJ0h56yINTO6E=; b=WTAW7NT9Aq+M6w
	7Kg0jg6FvkKvbIdjbFAN+i9eFCSvu9sXGkicMkWAkEmYbBKH6VXSoIOLmq//7vX3aOVlXrgoChOKN
	75gEZqVQrN+QkgEIQzuHq61GlcT167zQDg+UWV1xK6BvuwgRGUGbP6M6Tnwfu0xCs037u/W05as8e
	Y5uubWGqpIWMsx84Beg/KRj2q8pOIPcnzTzDzjukssfYp/bYbXYqxSZR1GN+JCRSSaMvvhElSTX7m
	prSROcpffeIh2GRDW4N0oePQhyQCmzdbff4hroylnh/joPFfaqVGyG6q56t5Br8zX5dXp7Ck8I92S
	XqNfAF+T7iZVb5HVhaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uifsK-000000098KI-19uP;
	Sun, 03 Aug 2025 21:04:12 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uifsH-000000098Jv-3cuP
	for linux-i3c@lists.infradead.org;
	Sun, 03 Aug 2025 21:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=D/Dk
	UWZlHZxpetzl0s5BJ4NhTM6PJP/Zbz/9uvwvr8k=; b=g1L3MtH6tZ3X+Vgx4tZq
	oGDGFUBeEd2yUlgvKxUxS98fruA/MMXDqmIO8au2XiYNlJzlH5eZ+PIY0lD5lk7T
	7JF4/3Sx+AJTpF/W5C6uThXz0vKVx62wSExAPzuNh7f/tMH4e15gli3fSzod5CAD
	cytCjKMMVywx9Ms4CzvgGtOLKinvodA4Gunr4sC8YUlw4GWnUa1xrvLFfo8uxnKG
	7aDncrhx8cT6Y0miHZl4yRtkTJOxm/P0ts4iFfLNo8FTWLVVlmDdlCc/SfLYxnQG
	RtIJ6/l+fNwk69CgDlKvDl6gk41akBXZ608+eIQZN+HBjfauplSXez6wCnbPbJOT
	Og==
Received: (qmail 1651282 invoked from network); 3 Aug 2025 23:04:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2025 23:04:07 +0200
X-UD-Smtp-Session: l3s3148p1@war2VHw79tYujntd
Date: Sun, 3 Aug 2025 23:04:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-i3c@lists.infradead.org
Subject: Re: [bug report] i3c: master: Add basic driver for the Renesas I3C
 controller
Message-ID: <aI_Ox9ORhE7kACaF@shikoro>
References: <aIyzJ7HOENL1qp1l@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIyzJ7HOENL1qp1l@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_140410_175291_78F8779B 
X-CRM114-Status: UNSURE (   8.87  )
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

Hi Dan,

thanks for the report. I'd argue it is not a bug, though.

>     677         for (pos = 0; pos < i3c->maxdevs; pos++) {
>     678                 if (newdevs & BIT(pos))
>     679                         i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);
> 
> Should we add checking for i3c_master_add_i3c_dev_locked()?

No, I think we should continue to add the remaining devices even if one
fails. Other driver do it also like above.

>     680         }
>     681 
> --> 682         return ret < 0 ? ret : 0;
> 
> Otherwise this could just be "return 0;"

True that, I will send a patch.

Happy hacking,

   Wolfram


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
