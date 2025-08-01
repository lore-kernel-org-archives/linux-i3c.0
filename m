Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA2AC87FCA
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f7lCwwVLL8P9uMsLgFyIb81dA+fbvJI+5HE7Fh0h5TM=; b=UDdVdbRdB5RwZU
	klbgz1EQefVWCkeAMl9KJcBLmSBnRFmAyuR0R56K8DHn4d5vV+0D56tW0hFKbVT2edqVvfPGlklgh
	b8zBqICAgjK2syX7pnJ8lXc+rZecIKsDlXExuUVJrVPOKFsqLigqHAOMYbeabPLdq+aVuvF0hI9ax
	QOayxROrcpkh1Fip/OGp3NWPrSF5E2NFHBPzbV0jN2SoWHZVJ92d5ZvVD4Mm+5fUw1K8fWaQa7G/W
	sWZ9Zek2sFjS1K1/d0nN9vpoM9/bv4mhhq9600uqs0dbTJkR/i5GOoOGc/npYPuxkw9ZNPqUiKtph
	x3WykeoumppVgUzTZWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpTn-000000063oC-2DBc;
	Fri, 01 Aug 2025 13:07:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhotB-00000005vCv-2qp9
	for linux-i3c@lists.infradead.org;
	Fri, 01 Aug 2025 12:29:34 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b7834f2e72so1345202f8f.2
        for <linux-i3c@lists.infradead.org>; Fri, 01 Aug 2025 05:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754051372; x=1754656172; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6VxgpJLp61iR3iDezPAb2armq0u2g+EEewZ0TEi/To=;
        b=NJA42KQEK4Zjxy7gJA9lmaBVwQS93RUeqcW8PIUntf1Oyu4KrrDxb9dQvFb9sBM1hr
         LJkQHpzoMXqrvOZRg3PiS0Jm+Y71k6WfvZmG8Iz1DjCg7KI4tyeF9hoQDD+1j12EfApt
         7kMglVX2klVNAbmhaBMeJvOHRmQGYQ6AyRQWokB5Z/9c4a4JYXu1jvkYpylyjpxHwf5T
         4S5jmUI4WSATjb+/4KEe7GFrDOhp9Bg7b4BdJ98694kBo6gOFEZIT4v+wXx91qjnuy/2
         J3x/TOLedIki3YjTviHUKX//3goRaKdNn8g5hR92R+cl/1ozAkQtmyfLsFYTWczucBrT
         Gu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754051372; x=1754656172;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6VxgpJLp61iR3iDezPAb2armq0u2g+EEewZ0TEi/To=;
        b=HFQ11u9FuU/3PzEtgpy8CZMDX3j+V4gDYF5vJk4WgfxMdMFRFdI7Lc09bBRB+znZno
         raTKkVNWU5VAf8M7gnr6l5caM8reYCy888rK1GcNZePgW0kmwf0yXTg/AO0FOLAz9wcH
         w/5jrxx5drp9VAOw4NEpl0SHRz9aTJ7GaE1JNOoC00E4r/zQHYvUDoAg54zhTB3otcN0
         zfd34aTK6mwyMhVDoTdvZFrrRmo70iZ7R7mhTnq+tFwdqkuCrrEbzPvstgUTQMlgCLlY
         HaG+KSOlDrjss/6sGcAmk+sdvBxXClQ8mjvF6+kYSz2HDPekAsATfqAoWRJ9qbt5ijDX
         FL4Q==
X-Gm-Message-State: AOJu0YzsdWUmwGfkKr3XHbZRR51JlP+fONN8jgR0kaCBeYm4LK2Xnrvc
	a6Ndz9C6XhLz4c+eV9XK2GyTiW6ByMiYHjEe8zLAP6L2FigLgnh/1tp+gjI5qA2rYCk=
X-Gm-Gg: ASbGnctBNYhMYDCSMk6YQ17qIenwy35jva/UU9zUn+dqCClTvACJPpsDBXXFf4hsY3P
	b2Cd+ta45SSvKbEM998SfmL7/GTo51nomSRKQq9EtEwxGrJrCg8UfOrhHAFS/k53xfu14BwwkEI
	UFdd4rcg3zebxw4RyEb6keq+uKJ0OA3JuqKFJeuGCYEiID5X3T5iWqIGdRFOlDtgjJwuiu80D/G
	INBKSdKSBnvBXFcRMocy7rltSWtta+NjXRZ0mI5PHsIZbZ2Xei+TwK9mT5JA6kOi201knebiEqA
	sDA8RybDhKNh/5Tldrjx8qT691Iq54Z6u1yaJ1WSvkMsXYqultyDQjB3PuH8VK6K+hT9IqFcVJV
	L2ABiltyAfWnqQ5toeRBPJpDkjLI=
X-Google-Smtp-Source: AGHT+IHMmDsPVMYN2fplxGfSRD/XQxk9OU2aOqiA+J4xeB7ynXdImJ99r2DFVm8ie9x2j2QNQDoKMw==
X-Received: by 2002:a05:6000:4007:b0:3b7:e3c3:fb9f with SMTP id ffacd0b85a97d-3b7e3c4000emr4555678f8f.49.1754051371945;
        Fri, 01 Aug 2025 05:29:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c453ca1sm5807736f8f.48.2025.08.01.05.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 05:29:31 -0700 (PDT)
Date: Fri, 1 Aug 2025 15:29:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org
Subject: [bug report] i3c: master: Add basic driver for the Renesas I3C
 controller
Message-ID: <aIyzJ7HOENL1qp1l@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_052933_748474_FC4E3B86 
X-CRM114-Status: UNSURE (   9.15  )
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

Hello Wolfram Sang,

Commit d028219a9f14 ("i3c: master: Add basic driver for the Renesas
I3C controller") from Jul 24, 2025 (linux-next), leads to the
following (unpublished) Smatch static checker warning:

	drivers/i3c/master/renesas-i3c.c:682 renesas_i3c_daa()
	warn: duplicate check 'ret < 0' (previous on line 660)

drivers/i3c/master/renesas-i3c.c
    622 static int renesas_i3c_daa(struct i3c_master_controller *m)
    623 {
    624         struct renesas_i3c *i3c = to_renesas_i3c(m);
    625         struct renesas_i3c_cmd *cmd;
    626         u32 olddevs, newdevs;
    627         u8 last_addr = 0, pos;
    628         int ret;
    629 
    630         struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
    631         if (!xfer)
    632                 return -ENOMEM;
    633 
    634         /* Enable I3C bus. */
    635         renesas_i3c_bus_enable(m, true);
    636 
    637         olddevs = ~(i3c->free_pos);
    638         i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_ENTDAA;
    639 
    640         /* Setting DATBASn registers for target devices. */
    641         for (pos = 0; pos < i3c->maxdevs; pos++) {
    642                 if (olddevs & BIT(pos))
    643                         continue;
    644 
    645                 ret = i3c_master_get_free_addr(m, last_addr + 1);
    646                 if (ret < 0)
    647                         return -ENOSPC;
    648 
    649                 i3c->addrs[pos] = ret;
    650                 last_addr = ret;
    651 
    652                 renesas_writel(i3c->regs, DATBAS(pos), datbas_dvdyad_with_parity(ret));
    653         }
    654 
    655         init_completion(&xfer->comp);
    656         cmd = xfer->cmds;
    657         cmd->rx_count = 0;
    658 
    659         ret = renesas_i3c_get_free_pos(i3c);
    660         if (ret < 0)
    661                 return ret;
    662 
    663         /*
    664          * Setup the command descriptor to start the ENTDAA command
    665          * and starting at the selected device index.
    666          */
    667         cmd->cmd0 = NCMDQP_CMD_ATTR(NCMDQP_ADDR_ASSGN) | NCMDQP_ROC |
    668                     NCMDQP_TID(I3C_COMMAND_ADDRESS_ASSIGNMENT) |
    669                     NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
    670                     NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
    671 
    672         renesas_i3c_wait_xfer(i3c, xfer);
    673 
    674         newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
    675         newdevs &= ~olddevs;
    676 
    677         for (pos = 0; pos < i3c->maxdevs; pos++) {
    678                 if (newdevs & BIT(pos))
    679                         i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);

Should we add checking for i3c_master_add_i3c_dev_locked()?

    680         }
    681 
--> 682         return ret < 0 ? ret : 0;

Otherwise this could just be "return 0;"

    683 }

regards,
dan carpenter

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
