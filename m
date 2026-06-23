Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0928CDB470
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jun 2026 08:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DqITPZtntdEjuqETwqpPDgsn977EagrfaMsG5++cFv8=; b=k6rkooOGOgoH+R
	4hj4tdY0ZeXAn9oV8dV4cnD5fTdW55SZk6V7r2ZNlpRZdfcLpHq5wdn3+yeEN6TEb0esANoZY6Vas
	T5+d2EVlQwfHKYT/krEX9ZwE33ekwRTW8V8CqHNM1yBofzGxgd6NKk0bSNcNgcGH1j4i0aHaFng7P
	0k55UP76VFDuLpNLJNtF+lQQBOHpclm///sfBybzxgjp/jr9c0LfZUuZ41ScKIbZ9oIe/V6zu0u+c
	rHLBY1iYXnUw8EEAoseZduYs1tt4tRC3U2nHzBQrpG5NdhlCmvH0JZtSTbMW4qT+07aZ+HE4KEA/n
	6oLfLSDi6lwpl/JN3+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwKJ-00000005tcL-2VER;
	Tue, 23 Jun 2026 08:17:47 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwKG-00000005tb8-43yP
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jun 2026 08:17:46 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84540eb70b2so2901435b3a.2
        for <linux-i3c@lists.infradead.org>; Tue, 23 Jun 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782202663; x=1782807463; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P6UtWX5sQXDt+7mf+zBgujLvN8/tU9UOJPkjx2IBg9I=;
        b=WHRFVa75rgKUSd3LN8dyvZNBA8xgor0oc56c+uvOxAaC7ypD6kgI0dRclvE6B4h39f
         2n0AtqBQKTRYG2lg00EfIxa2YruM8VYUbg5+kWofRUwRkH8QWYJ36e2r7hTOwmL3cgEA
         RftHhLMWEqZ87CGpPeSihjt2d+nAUhhs9g+g1hf9+3S7ecrRcBgw7svkojJGPlGmjmQ1
         GsOiHkfCr8xxaw/YXE3hAuugJ/x9owuwtXWd8oiJoGWmAhzg2tfyO2axFZcmR4oOkrK7
         dPMq+NCKrj18oDW/Og2gR3CbrMtD2V4jko7f0OEwG6gfP3he3DQK1mjH2EKI3kNrN8t6
         z/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782202663; x=1782807463;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6UtWX5sQXDt+7mf+zBgujLvN8/tU9UOJPkjx2IBg9I=;
        b=ibuVJuGZnbS2JEExWfnr2szH1kCjl+0jczW2ktZjEtB8PGcPHLqq4xiMM6TDJem4sA
         uh3vU0fXYxPJXgEDKOkB5szBT5y7JyMZKjq2XXVr8msOEDwKEe1K1lAADjf9msuh7up/
         uKLG7g5J1jS7A56DMRM2w+uuU56UIXMy3Iy+2IZe52XK0fXbG1PlC4O50Df057cxV6v0
         K+QqAvDpDrSxjutKAkZXQIuRgTuUUz6rPvYkpI0X6pUg8+gKHSFoW56ha0hQ7rDnYuWH
         cJSi8TT9D0jNHtd8lrQ4qoKEkHeDEI43Biv5OQdv4ko6JXPOILj2X3c4U609bSbSezoj
         pe2w==
X-Forwarded-Encrypted: i=1; AFNElJ8hukcJ/PZMT1R2i2cFp3JB8wHLWkNa+sa3a4ukUACiCOnI8DK0tU6EBV+DhYkKh4bPxkZ7tXXc1Zc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXbDOE+H9A4Fky1W0fmCC7NiatGJPBLiiML3hfvZiENQGNKuN5
	gbbWq0IAav6AlkGmj1l9zsWDVF6nUCyt3DAQb2WpBtjPC6u9OkaSnS//
X-Gm-Gg: AfdE7ckSQb5NWtO1iuDgsnImIaYu4dVvTwBmy9nYT167y5fRENjGhxpS165ngrSkmek
	y74Mr4FWVkg/x+SB/j6FSsApwDUqvF1ZQ1JcJu4VC7nXPfizAm91XddWPlngTcQ2lo++9tpd8Av
	NsU1i3wf5xjyh/WzV4iUC7CgjgmrUN2r/0/RUtB5unZnj+foW7STGoW6xeM0+Pjo9eEzxsr+368
	ivfY3XB/aQpshP+OhtOpbhvKi1Yz9gE0waB6gdxsXzzQfsdWRdiUxVM+HrzytwMuO2yI/NaeSfP
	fo8USH+agU0rhEQvN5fxNgI4DeVpoKPvv+B+6VqPj2UeFDbTu2hvRFyc+H7ih6ziZd5O3TplmKJ
	h3k2R5WJOk1b9hUI8DqoaqEa039LuMVApUkN+Co0vfzsDWsrnHx6gK/3fXEvBbNVD8buX5Fe6Et
	oacZQspH2AhO792TqsglPTZ7qlgCnonRktTtjtmQ==
X-Received: by 2002:a05:6a00:4147:b0:841:58b0:82c8 with SMTP id d2e1a72fcca58-84562478f55mr13938631b3a.13.1782202663387;
        Tue, 23 Jun 2026 01:17:43 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e745cfsm9821568b3a.31.2026.06.23.01.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:17:42 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: i3c: master: svc: IBI payload not bounded by max_payload_len
Date: Tue, 23 Jun 2026 16:17:38 +0800
Message-ID: <178220265899.2552261.12288525775100092849@maoyixie.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_011745_020707_8B13DE1F 
X-CRM114-Status: GOOD (  10.59  )
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

Hi all,

I think svc_i3c_master_handle_ibi() in drivers/i3c/master/svc-i3c-master.c
can write past the IBI slot buffer when a device sends a large IBI payload.
I would appreciate it if you could let me know whether you agree.

The read loop bounds the slot only by the hardware FIFO size, not by the
requested max_payload_len.

	slot->len = 0;
	buf = slot->data;
	while (SVC_I3C_MSTATUS_RXPEND(...) && slot->len < SVC_I3C_FIFO_SIZE) {
		mdatactrl = readl(master->regs + SVC_I3C_MDATACTRL);
		count = SVC_I3C_MDATACTRL_RXCOUNT(mdatactrl);
		readsb(master->regs + SVC_I3C_MRDATAB, buf, count);
		slot->len += count;
		buf += count;
	}

slot->data points into the IBI pool. i3c_generic_ibi_alloc_pool() sizes each
slot at max_payload_len. svc_i3c_master_request_ibi() only rejects a
max_payload_len above SVC_I3C_FIFO_SIZE (16). So a driver can ask for a small
window, and mctp-i3c asks for 1. count comes from the controller RXCOUNT
field and can be up to 31. The loop stops at SVC_I3C_FIFO_SIZE, not at the
window. A device that sends more bytes than the window overruns slot->data
into the pool.

dw-i3c and mipi-i3c-hci bound this same read against max_payload_len. dw-i3c
has "if (dev->ibi->max_payload_len < len)". svc looks like the one that
bounds by the FIFO size instead.

I reproduced the write on 7.1-rc7 by running the same loop into a 2 byte
window.

  BUG: KASAN: slab-out-of-bounds in ...
  ... located 0 bytes to the right of a 2-byte region ... Write

Bounding the drain by max_payload_len, like dw-i3c does, would close it.
Does this look like a real bug to you, and is that the right fix? I am happy
to send a proper patch once you confirm.

Kaixuan Li and I found this together.

Thanks,
Maoyi
https://maoyixie.com/

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
