Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34542CA0EE8
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMc/J4hcGH+6VGFOzWRx/OFw6gbB+vn++Zmh2E+HV7Q=; b=QmzicdBtOzlEnL
	g5sQy89mT8FqJOKlkKsszwulM6ziiwCczj6FZa8/Y71s6lZ/IznGRkFKooBYrgwDLhaaRygo72Tv0
	sEjqslmGFNaqRr2ZmlSlW3/S59nE9bykaSFEAW7HWVw4HgTAjPzT/4/OY3cBbSA0FXQ2qX3fdxt5Q
	u4Fk0xkhULV/jcwEyy4N1CF6NQfzVn3YXqfimZ6piCekdEPgkhTPanRud50IZju0/dQdz4V38mvsm
	6F0ixJCOUcwtEIboSzr1dFFgFouDjaxtCJ9YTz/9bB3+7CFanbQjynzMWMPdkkyU1KXzjxTnkgvlY
	g7mAYuigRVQnZqA0jv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxuPJ-00000002Fzg-3ILB;
	Sun, 14 Sep 2025 21:37:13 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxuPF-00000002Fxk-2egw
	for linux-i3c@lists.infradead.org;
	Sun, 14 Sep 2025 21:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lAh2
	9qMOUXQ/TP64YFXHyhbZt3V0AZYWq1eFjSQXKFA=; b=VYiMzvbZwOlSk+oqTTcB
	OcVCIEbpJJAWaXZjzI13t6dPwMlOVbqbBxqh4OOxBGXazX1+6deHIWvLf3Km7A5a
	0zMhsHkc1a1/pQI5xi7b5K8/8elJ0Oy9hlJNCNiG0PfdfxbheqJWRTlGwkn6zYsi
	sq0n0iobgmiNtPsLWVsHxMiiim3e3KyhTK0C1wkF9YYi9nsPpASBH5je7Bc6zpiR
	0rWN4bgk+2hxEkjYUva2e//plPVeVg0d2/mBZXk4b/xA39YJgp8qWw5nDJhWNKBT
	yYsHWftZ23IJkeE/rHibXdOy6zr2gm2IcwPOn+LtyzoHJb5eOHiHIWualtHVq6gw
	ww==
Received: (qmail 2122476 invoked from network); 14 Sep 2025 23:36:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2025 23:36:57 +0200
X-UD-Smtp-Session: l3s3148p1@th6sr8k+CIQgAQnoAHzAAGOD5Y6fT3HK
Date: Sun, 14 Sep 2025 23:36:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] i3c: master: Remove ternary operator on return
 statement
Message-ID: <aMc1eMXynVbozUMz@shikoro>
References: <20250902135239.2632286-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902135239.2632286-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_143710_545960_DE5709AB 
X-CRM114-Status: UNSURE (   7.84  )
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

On Tue, Sep 02, 2025 at 02:52:39PM +0100, Colin Ian King wrote:
> The value of ret at the end of the function renesas_i3c_daa
> is always zero since previous checks for less than zero have already
> exited via return paths. Hence the final ternary operator checking
> for a less than zero value for ret is redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Already sent (and applied just today):

https://lore.kernel.org/r/20250803211256.18513-2-wsa+renesas@sang-engineering.com


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
